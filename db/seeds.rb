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
    visualization_type_id: 2,
    sensor: "temp-1000",
    abbreviation: "T1",
    station_id: 1
  },
  {
    id: 2,
    label: "Thermometer",
    unit: "°C",
    active: true,
    visualization_type_id: 2,
    sensor: "tempX2000",
    abbreviation: "inti5",
    station_id: 1
  },
  {
    id: 3,
    label: "Lichtsensor",
    unit: "lux",
    active: true,
    visualization_type_id: 3,
    sensor: "light_5x",
    abbreviation: "l1",
    station_id: 1
  },
  {
    id: 4,
    label: "Licht Terasse",
    unit: "lux",
    active: true,
    visualization_type_id: 2,
    sensor: "light_5x",
    abbreviation: "l2",
    station_id: 2
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
    name: "Scatter",
    chart_keyword: "scatter"
  },
  {
    name: "Line",
    chart_keyword: "spline"
  },
  {
    name: "Bar",
    chart_keyword: "column"
  },
  {
    name: "Area",
    chart_keyword: "areaspline"
  }
  ])

ApiToken.create!(
            token: "asdfghjkl"
)
