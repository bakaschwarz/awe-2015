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

LOOP_IN_SEC = 3

URL = URI("http://localhost:3000/weather_update/create")

SENSOR_ABBREVIATIONS = %w[
  t0
  t1
  f1
  t2
  t3
  h0
  p0
  l0
  l1
  l2
  t9
]

while true do
  # Create JSON File
  update_data_1 = {
      "_n"                    => 1,
      "_t"                    => Time.now.to_i,
      SENSOR_ABBREVIATIONS[3] => rand(18..20),
      SENSOR_ABBREVIATIONS[4] => rand(24..25),
      SENSOR_ABBREVIATIONS[5] => rand(60..62),
      SENSOR_ABBREVIATIONS[6] => 1012,
      SENSOR_ABBREVIATIONS[7] => rand(16..18),
      SENSOR_ABBREVIATIONS[8] => rand(10..13),
      SENSOR_ABBREVIATIONS[9] => rand(17..22)
  }

  update_data_2 = {
      "_n"                    => 2,
      "_t"                    => Time.now.to_i,
      SENSOR_ABBREVIATIONS[0] => rand(50..54),#{}`cat /sys/class/thermal/thermal_zone0/temp`[0..1],
      SENSOR_ABBREVIATIONS[1] => rand(50..54),
      SENSOR_ABBREVIATIONS[2] => rand(285..300),
  }

  update_data_3 = {
      "_n"                    => 3,
      "_t"                    => Time.now.to_i,
      SENSOR_ABBREVIATIONS[10] => rand(17..22)
  }

  update_data_4 = {
      "_n"                    => 4,
      "_t"                    => Time.now.to_i,
      SENSOR_ABBREVIATIONS[10] => rand(17..22)
  }

  json_file = {"s_d" => [update_data_1, update_data_2, update_data_3, update_data_4], "api_token" => "asdfghjkl"}.to_json
  # Prepare Connection
  target_website ||= Net::HTTP.new(URL.host, URL.port).tap {|http|
    http.open_timeout = 2
    http.read_timeout = 2
  }
  post_request = Net::HTTP::Post.new URL
  post_request.body = json_file
  post_request.content_type = "application/json"
  target_website.request post_request
  sleep LOOP_IN_SEC
end