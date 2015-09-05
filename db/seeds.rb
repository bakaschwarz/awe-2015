# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(
  email: "example@example.com",
  password: "asdf",
  password_confirmation: "asdf"
  )

Sensor.create!([
  {
    id: 1,
    label: "UV-Licht vorne",
    unit: "lux",
    active: true,
    visualization_type_id: 1,
    sensor: "UV-2421-mega",
    abbreviation: "UV",
    station_id: 1
  }, 
  {
    id: 2,
    label: "Temperatur Luft",
    unit: "°C",
    active: true,
    visualization_type_id: 1,
    sensor: "temp-1000",
    abbreviation: "T1",
    station_id: 1
  },
  {
    id: 3,
    label: "Temperatursensor Strahlung",
    unit: "°C",
    active: false,
    visualization_type_id: 2,
    sensor: "tempX-2200",
    abbreviation: "T2",
    station_id: 1
  },
  {
    id: 4,
    label: "Temperatur Garten",
    unit: "°C",
    active: true,
    visualization_type_id: 1,
    sensor: "temp-1000",
    abbreviation: "TG",
    station_id: 2
  },
  ])

Station.create!([
  {
    label: "Küche",
    description: "Station in der Küche mit voller Sensorausstattung"
  }, 
  {
    label: "Garten",
    description: "Station im Garten bei Apfelbaum (Prototyp)"
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

SensorDatum.create!([
  {
    time_stamp: 1989170556,
    sensor_id: 1,
    value: 13
  },
  {
    time_stamp: 1989171556,
    sensor_id: 1,
    value: 16
  },
  {
    time_stamp: 1989172556,
    sensor_id: 1,
    value: 18
  },
  {
    time_stamp: 1989173556,
    sensor_id: 1,
    value: 19
  },
  {
    time_stamp: 1989173556,
    sensor_id: 2,
    value: 23.2
  },
  {
    time_stamp: 1989174556,
    sensor_id: 2,
    value: 23.3
  },
  {
    time_stamp: 1989175556,
    sensor_id: 2,
    value: 23.1
  },
    {
    time_stamp: 1989170556,
    sensor_id: 3,
    value: 16.9
  },
  {
    time_stamp: 1989171556,
    sensor_id: 3,
    value: 18.2
  },
  {
    time_stamp: 1989172556,
    sensor_id: 3,
    value: 19.2
  },
  {
    time_stamp: 1989173556,
    sensor_id: 4,
    value: 8.2
  },
  {
    time_stamp: 1989172556,
    sensor_id: 4,
    value: 8.3
  },
  {
    time_stamp: 1989174556,
    sensor_id: 4,
    value: 8.6
  }
  ])

ApiToken.create!(
            token: "asdfghjkl"
)
