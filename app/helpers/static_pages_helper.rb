module StaticPagesHelper

  def ordered_timestamps_for_stations(options = {start: 0, end: Time.now.to_i})
    sensor_data_unsorted = SensorDatum.order("sensor_data.time_stamp DESC").where(time_stamp: options[:start]..options[:end])
    ordered_stamps = {}
    sensor_data_unsorted.each do |sensor_data|
      station = Station.find(Sensor.find(sensor_data[:sensor_id]).station_id)
      ordered_stamps[station] ||= Hash.new
      ordered_stamps[station][sensor_data[:time_stamp]] ||= Hash.new
      ordered_stamps[station][sensor_data[:time_stamp]][sensor_data[:sensor_id]] = sensor_data[:value]
    end
    ordered_stamps
  end

  def generate_yaxis_by_station(station, options = {})
    y_axis_array = []
    @unit_sensor_hash = {}
    station.sensors.each do |sensor|
      @unit_sensor_hash[sensor.unit] ||= @unit_sensor_hash.keys.size
    end

  end
end