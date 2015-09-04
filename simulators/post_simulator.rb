require "json"
require "ipaddr"
require "net/http"

HOST = "localhost"
PATH = "/weather_update/create"
PORT = 3000

URL = URI("http://localhost:3000/weather_update/create")

SENSOR_ABBREVIATIONS = %w[
  UV
  T1
  T2
]


while true do

  # Create JSON File

  update_data = {
      SENSOR_ABBREVIATIONS[0] => rand(1..100),
      SENSOR_ABBREVIATIONS[1] => `cat /sys/class/thermal/thermal_zone0/temp`[0..1],
      SENSOR_ABBREVIATIONS[2] => `cat /sys/class/thermal/thermal_zone0/temp`[0..1],
      "_t"                    => Time.now.to_i
  }

  json_file = {"s_d" => [update_data], "api_token" => "asdfghjkl"}.to_json

  # Prepare Connection

  target_website ||= Net::HTTP.new(URL.host, URL.port).tap {|http|
    http.open_timeout = 1
    http.read_timeout = 1
  }

  post_request = Net::HTTP::Post.new URL
  post_request.body = json_file
  post_request.content_type = "application/json"

  target_website.request post_request
  sleep 4
end