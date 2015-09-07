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

LOOP_IN_SEC = 5

URL = URI("http://localhost:3000/weather_update/create")

SENSOR_ABBREVIATIONS = %w[
  T1
  inti5
  l1
  l3
]

while true do
  # Create JSON File
  update_data = {
      "_n"                    => 1,
      "_t"                    => Time.now.to_i,
      SENSOR_ABBREVIATIONS[0] => rand(20..25),#{}`cat /sys/class/thermal/thermal_zone0/temp`[0..1],
      SENSOR_ABBREVIATIONS[1] => rand(40..50),
      SENSOR_ABBREVIATIONS[2] => rand(14..18),
      SENSOR_ABBREVIATIONS[3] => rand(16..22)
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