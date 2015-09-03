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
    label: "UV-Licht vorne",
    unit: "lux",
    active: true,
    visualization_type_id: 1,
    sensor: "UV-2421-mega",
    abbrevation: "UV",
    station: 1
  }, 
  {
    label: "Temperatur Luft",
    unit: "°C",
    active: true,
    visualization_type_id: 1,
    sensor: "temp-1000",
    abbrevation: "T1",
    station: 1
  },
  {
    label: "Temperatursensor Strahlung",
    unit: "°C",
    active: false,
    visualization_type_id: 2,
    sensor: "tempX-2200",
    abbrevation: "T2",
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

SensorDatum.create!([
  {
    time_stamp: 123543332,
    sensor_id: 1,
    value: 13
  },
  {
    time_stamp: 123544332,
    sensor_id: 1,
    value: 16
  },
  {
    time_stamp: 123545332,
    sensor_id: 1,
    value: 18
  },
  {
    time_stamp: 123546332,
    sensor_id: 1,
    value: 19
  },
  {
    time_stamp: 123545332,
    sensor_id: 2,
    value: 23.2
  },
  {
    time_stamp: 123546332,
    sensor_id: 2,
    value: 23.3
  },
  {
    time_stamp: 123547332,
    sensor_id: 2,
    value: 23.1
  },
  ])
