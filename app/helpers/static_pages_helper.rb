module StaticPagesHelper

  def ordered_timestamps_for_stations
    sensor_data_unsorted = SensorDatum.order("sensor_data.time_stamp DESC").all
    ordered_stamps = Hash.new
    sensor_data_unsorted.each do |sensor_data|
      station = Station.find(Sensor.find(sensor_data[:sensor_id]).station_id)
      ordered_stamps[station] ||= Hash.new
      ordered_stamps[station][sensor_data[:time_stamp]] ||= Hash.new
      ordered_stamps[station][sensor_data[:time_stamp]][sensor_data[:sensor_id]] = sensor_data[:value]
    end
    ordered_stamps
  end
end