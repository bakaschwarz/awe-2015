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
    visualization: "Liniendiagramm",
    sensor: "UV-2421-mega"
  }, 
  {
    label: "Temperatur 1",
    unit: "C",
    active: true,
    visualization: "Liniendiagramm",
    sensor: "temp-1000"
  },
  {
    label: "Temperatur 2",
    unit: "C",
    active: false,
    visualization: "Punktediagramm",
    sensor: "tempX-2200"
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
