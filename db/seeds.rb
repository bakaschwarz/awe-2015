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
    label: "Temperatur",
    unit: "C",
    active: true,
    visualization: "Liniendiagramm",
    sensor: "temp-1000"
  }
  ])
