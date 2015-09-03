#!/usr/bin/env ruby
#
# SYNOPSIS
#
#   bin/hook-simulator.rb --url URL --token TOKEN [--fast|--slow] [--continuous] [-n NUM]
#
#   Ein einfacher Mock für hook.sh, der den Lebenszyklus eines OpenVPN-Servers
#   abbildet, zu dem sich n Clients verbinden.
#
#   Dient u.a. dazu die Datenbank so seeden.
#
# OPTIONS
#
#   --url URL       URL, an die ein JSON-Payload gepostet wird.
#
#   --token TOKEN   ein Token zur Authentifizierung (wird im HTTP-Header als
#                   X-Authentication-Token mitgesendet).
#
#   -n NUM          Anzahl zu simulierender Clients. Default: 3
#
#   --continuous    Beendet Client-Verbindungen zufällig und startet sie neu.
#
#   --fast, --slow  Im Normalbetrieb (weder --fast noch --slow gegeben) werden
#                   an verschiedenen stellen `sleep`-Calls eingeführt. Um besser
#                   debuggen zu können, lassen sich die Zeiträume dieser sleeps
#                   mit --slow drastisch verlängern. Um diese Zeiträume z.B. für
#                   Stresstests zu reduzieren eignet sich --fast.
#
# TODO/LIMITATIONS
#
#   "Clients" "verbinden" sich schön geordnet nacheinander damit der Code
#   einigermaßen übersichtlich bleibt, Im realen Einsatz passiert dies natürlich
#   parallel.

require "json"
require "ipaddr"
require "net/http"

class Simulator
  EVENTS = %w[
    up
    tls-verify
    ipchange
    client-connect
    route-up
    route-pre-down
    client-disconnect
    down
    learn-address
    auth-user-pass-verify
  ]

  SIGNALS = %w[
    sigusr1
    sighup
    sigterm
    sigint
    ping-exit
    ping-restart
    error
    unknown
  ]

  class Client
    attr_reader :simulator, :env, :connected

    def initialize(simulator, name)
      @simulator    = simulator
      @env          = {}
      @common_name  = name
      @connected    = false
    end

    def connect
      simulator.set \
        untrusted_ip:   ip_addr,
        untrusted_port: port
      simulator.event "tls-verify", 1, *%w[ C=DE, L=Bremen, O=Digineo GmbH, OU=OpenSpot, CN=Digineo GmbH CA ]
      simulator.event "tls-verify", 0, *%w[ C=DE, L=Bremen, O=Digineo GmbH, OU=OpenSpot, ], "CN=#{@common_name}"

      disconnect if @connected

      simulator.set \
        common_name:    @common_name,
        trusted_ip:     ip_addr,
        trusted_port:   port,
        untrusted_ip:   ip_addr,
        untrusted_port: port
      simulator.event "client-connect"

      simulator.set \
        common_name:    @common_name,
        trusted_ip:     ip_addr,
        trusted_port:   port,
        untrusted_ip:   ip_addr,
        untrusted_port: port
      simulator.event "learn-address", "update", "10.8.254.#{rand 10...255}", @common_name

      @connected = true
    end

    def disconnect
      return unless @connected

      simulator.set \
        common_name:    @common_name,
        trusted_ip:     ip_addr,
        trusted_port:   port,
        untrusted_ip:   ip_addr,
        untrusted_port: port,
        bytes_received: rand(10**3 .. 100*10**9), # 1 KB .. 100 GB
        bytes_sent:     rand(10**3 .. 100*10**9)
      simulator.event "client-disconnect"

      @connected = false
    end

    def reconnect
      ip_addr true
      connect
    end

  private
    attr_reader :simulator, :env

    def ip_addr(reload=false)
      @ip_addr   = nil if reload
      @ip_addr ||= IPAddr.new(rand(1...2**32), Socket::AF_INET).to_s
    end

    def port(reload=false)
      @port   = nil if reload
      @port ||= rand(1024...2**16)
    end
  end

  def initialize(url:, token:, num_clients: 3, continuous: false, speedup: 1)
    @env, @mode = {}, "server"
    @url, @token = URI(url), token

    @clients    = (0...num_clients.to_i).map{|i| Client.new self, "node#{i}" }
    @continuous = continuous
    @speedup    = speedup.to_f
  end

  def pause(sec)
    sleep sec/@speedup
  end

  def simulate_server
    puts "start simulator"
    puts "-- clients:     #{@clients.size}"
    puts "-- continuous:  #{@continuous}"
    puts "-- speedup:     #{@speedup}"

    event "up"
    pause 2

    @clients.each(&:connect)

    loop do
      @clients.shuffle!
      @clients.sample(rand @clients.size).map(&:reconnect)

      if @continuous
        going, staying = @clients.partition{|_| rand > 0.33 }
        going.each(&:disconnect) # 33% verlassen uns
        puts "paused simulator"
        puts "-- connected:     #{staying.size}"
        puts "-- disconnected:  #{going.size}"
        puts "-- continuing in #{5/@speedup}s"
        pause 5
        going.each(&:connect) # hier kommen sie wieder
      else
        @clients.each(&:disconnect)
        break
      end
    end

  rescue Interrupt
    puts "shutdown simulator"
    @speedup = 10
  ensure
    @clients.each(&:disconnect)
    env = { signal: SIGNALS.sample }
    event "down"
  end

  def set(new_env={})
    @env = new_env.dup
  end

  def get(key)
    val = env[key]
    val if val && val != ""
  end

  def event(name, *args)
    puts "#{@mode}:   #{name} #{args.join ' '}"
    env[:script_type] = name
    post! event_data_json(args)
    pause rand
  end

  def post!(data)
    @http ||= Net::HTTP.new(url.host, url.port).tap {|http|
      http.open_timeout = 1
      http.read_timeout = 1
    }
    req = Net::HTTP::Post.new url
    req.body = data
    req.add_field "X-Authentication-Token", token
    req.content_type = "application/json"

    case (res = @http.request req)
    when Net::HTTPSuccess
      puts "#{@mode}:   Success!"
    when Net::HTTPUnauthorized, Net::HTTPForbidden
      puts "#{@mode}:   Authentication failure!"
    else
      puts "#{@mode}:   Got something else: #{$!.class}"
    end

  rescue Net::ReadTimeout
    puts "#{@mode}:   Got a read timeout!"
  rescue Net::OpenTimeout
    puts "#{@mode}:   Got an open timeout!"
  end

private
  attr_reader :env, :url, :token

  def event_data_json(args)
    {
      "mode"            => @mode,
      "timestamp"       => Time.now.to_i,
      "script_type"     => get(:script_type),
      "args"            => args,
      "bytes_received"  => get(:bytes_received),
      "bytes_sent"      => get(:bytes_sent),
      "common_name"     => get(:common_name),
      "trusted_ip"      => get(:trusted_ip),
      "trusted_ip6"     => get(:trusted_ip6),
      "trusted_port"    => get(:trusted_port),
      "untrusted_ip"    => get(:untrusted_ip),
      "untrusted_ip6"   => get(:untrusted_ip6),
      "untrusted_port"  => get(:untrusted_port),
      "signal"          => get(:signal)
    }.to_json
  end

end

options = {
  continuous:   false,
  num_clients:  3,
  speedup:      1
}


if i = ARGV.index("--url")
  _, url = ARGV.slice!(i, 2)
  options[:url] = url
end

if i = ARGV.index("--token")
  _, token = ARGV.slice!(i, 2)
  options[:token] = token
end

if i = ARGV.index("--continuous")
  ARGV.slice! i
  options[:continuous] = true
end

if i = ARGV.index("-n")
  _, n = ARGV.slice!(i, 2)
  options[:num_clients] = n.to_i
end

if i = ARGV.index("--fast")
  ARGV.slice! i
  options[:speedup] = 10
end

if i = ARGV.index("--slow")
  ARGV.slice! i
  options[:speedup] = 0.1
end

sim = Simulator.new options
sim.simulate_server
