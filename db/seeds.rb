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
    label: "Laptop Temperatur",
    unit: "°C",
    active: true,
    visualization_type_id: 1,
    sensor: "temp-1000",
    abbreviation: "T1",
    station_id: 1
  }
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

ApiToken.create!(
            token: "asdfghjkl"
)
