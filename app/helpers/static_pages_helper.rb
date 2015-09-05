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


  def get_line_chart_by_unit(time_stamp_hash)
    data_table = GoogleVisualr::DataTable.new
    Sensor.all.each do |sensor|
      data_table.new_column 'number', (sensor.unit ||= "N/A")
    end
    data_table.add_rows(10)
    opts   = { :width => 400, :height => 240, :title => 'Company Performance', :legend => 'bottom' }
    @chart = GoogleVisualr::Interactive::LineChart.new(data_table, opts)
  end
end