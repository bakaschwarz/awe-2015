module StaticPagesHelper

  def ordered_timestamps_for_stations
    sensor_data_unsorted = SensorDatum.order("sensor_data.time_stamp DESC").all
    ordered_stamps = {}
    sensor_data_unsorted.each do |sensor_data|
      station = Station.find(Sensor.find(sensor_data[:sensor_id]).station_id)
      ordered_stamps[station] ||= Hash.new
      ordered_stamps[station][sensor_data[:time_stamp]] ||= Hash.new
      ordered_stamps[station][sensor_data[:time_stamp]][sensor_data[:sensor_id]] = sensor_data[:value]
    end
    ordered_stamps
  end


  def get_line_chart_by_sensor(sensor, options = {start: 0, rows: 5})
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('datetime', 'Time')
    data_table.new_column('number', sensor.label)

    counter = 0
    sensor.sensor_data.each do |sensor_datum|
      if sensor_datum.time_stamp > options[:start]
        data_table.add_rows(1)
        data_table.set_cell(counter, 0, Time.at(sensor_datum.time_stamp).to_datetime)
        data_table.set_cell(counter, 1, sensor_datum.value)
        counter += 1
      end
    end
    opts   = {:width => "95%", :height => "15%", :title => "#{sensor.label} [#{sensor.unit}]", :legend => 'bottom' }
    GoogleVisualr::Interactive::LineChart.new(data_table,opts)
  end
end