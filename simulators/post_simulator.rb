require "json"
require "ipaddr"
require "net/http"

HOST = "localhost"
PATH = "/weather_update/create"
PORT = 3000

URL = URI("#{HOST}:#{PORT}#{PATH}")

SENSOR_ABBREVIATIONS = %w[
  UV
  T1
  T2
]


loop do

  # Create JSON File



  # Prepare Connection

  target_website ||= Net::HTTP.new(URL.host, URL.port).tap {|http|
    http.open_timeout = 1
    http.read_timeout = 1
  }
  post_request = Net::HTTP::Post.new URL
  post_request.body = @json_file
  post_request.content_type = "application/json"

  sleep 30
end