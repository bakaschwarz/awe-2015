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

ApiToken.create!(
            token: "asdfghjkl"
)