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
    label: "CPU Temperatur",
    unit: "°C",
    visualization_type_id: 2,
    sensor: "temp0",
    abbreviation: "t0",
    station_id: 2
  },
  {
      id: 2,
      label: "GPU Temperatur",
      unit: "°C",
      visualization_type_id: 2,
      sensor: "temp1",
      abbreviation: "t1",
      station_id: 2
  },
  {
      id: 3,
      label: "FAN Speed",
      unit: "RPM",
      visualization_type_id: 2,
      sensor: "fan1",
      abbreviation: "f1",
      station_id: 2
  },
  {
      id: 4,
      label: "Außentemperatur",
      unit: "°C",
      visualization_type_id: 2,
      sensor: "temp2",
      abbreviation: "t2",
      station_id: 1
  },
  {
      id: 5,
      label: "Innentemperatur",
      unit: "°C",
      visualization_type_id: 2,
      sensor: "temp3",
      abbreviation: "t3",
      station_id: 1
  },
  {
      id: 6,
      label: "Luftfeuchtigkeit",
      unit: "%",
      visualization_type_id: 2,
      sensor: "humid0",
      abbreviation: "h0",
      station_id: 1
  },
  {
      id: 7,
      label: "Luftdruck",
      unit: "mbar",
      visualization_type_id: 2,
      sensor: "press0",
      abbreviation: "p0",
      station_id: 1
  },
  {
      id: 8,
      label: "Lichtstärke",
      unit: "lux",
      visualization_type_id: 2,
      sensor: "light0",
      abbreviation: "l0",
      station_id: 1
  },
  {
      id: 9,
      label: "Infrarot",
      unit: "lux",
      visualization_type_id: 2,
      sensor: "light1",
      abbreviation: "l1",
      station_id: 1
  },
  {
      id: 10,
      label: "UV-Licht",
      unit: "lux",
      visualization_type_id: 2,
      sensor: "light2",
      abbreviation: "l2",
      station_id: 1
  }
  ])

Station.create!([
  {
      label: "Wetterstation (Fenster 3)",
      description: "Dachgeschoss, erstes Fenster links",
      node_number: 1,
      index_dashboard: 1
  },
  {
      label: "Laptop (Pseudo-Wetterstation)",
      description: "Thinkpad S540 (Intel inside)",
      node_number: 2,
      index_dashboard: 2
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
