module StaticPagesHelper

  def ordered_timestamps_for_stations
    sensor_data_unsorted = SensorDatum.order("sensor_data.time_stamp DESC").all
    ordered_stamps = {}
    sensor_data_unsorted.each do |sensor_data|
      station = Station.find(Sensor.find(sensor_data[:sensor_id]).station_id).id
      ordered_stamps[station] ||= {}
      ordered_stamps[station][sensor_data[:time_stamp]] ||= {}
      ordered_stamps[station][sensor_data[:time_stamp]][:sensor_id] = sensor_data[:value]
    end
  end
end