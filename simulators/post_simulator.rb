=begin
  Benötigt einen laufenden Server unter localhost:3000.
  In der Seeds Datei muss sich folgendes befinden:

  ApiToken.create!(
            token: "asdfghjkl"
  )

  Sensor.create!([
    {
      label: "UV-Licht vorne",
      unit: "lux",
      active: true,
      visualization_type_id: 1,
      sensor: "UV-2421-mega",
      abbreviation: "UV",
      station: 1
    },
    {
      label: "Temperatur Luft",
      unit: "°C",
      active: true,
      visualization_type_id: 1,
      sensor: "temp-1000",
      abbreviation: "T1",
      station: 1
    },
    {
      label: "Temperatursensor Strahlung",
      unit: "°C",
      active: false,
      visualization_type_id: 2,
      sensor: "tempX-2200",
      abbreviation: "T2",
      station: 1
    }
  ])

  VisualizationType.create!([
    {
      name: "Punktediagramm"
    },
    {
      name: "Liniendiagramm"
    },
    {
      name: "Balkendiagramm"
    }
  ])


=end

require "json"
require "ipaddr"
require "net/http"

LOOP_IN_SEC = 1

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
      SENSOR_ABBREVIATIONS[1] => rand(20..25),
      SENSOR_ABBREVIATIONS[2] => rand(10..12),
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
  sleep LOOP_IN_SEC
end