module StaticPagesHelper

  def ordered_timestamps_for_stations(options = {start: 0, end: Time.now.to_i})
    sensor_data_unsorted = SensorDatum.order("sensor_data.time_stamp ASC").where(time_stamp: options[:start]..options[:end])
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
      if @unit_sensor_hash[sensor.unit].nil?
        new_y_axis = "{
        labels: {
          format: '{value} #{sensor.unit}',
          style: {
            color: 'black'
          }
        },
        title: {
          text: '',//'#{station.sensors.clone.to_a.delete_if{ |s|
          s.unit != sensor.unit }.map{|s|
          s.label }.join(', ')}',
          style: {
            color: 'black'
          }
        },
        opposite: #{@unit_sensor_hash.keys.size == 0 ? 'false' : 'true'}

      }"
      y_axis_array.push new_y_axis
      end
      @unit_sensor_hash[sensor.unit] ||= @unit_sensor_hash.keys.size
    end
     "[" + y_axis_array.join(", ") + "]"
  end

  def generate_series_by_station(station, time_stamp_hash, unit_sensor_hash, options = {})
    series_array = []

    station.sensors.each do |sensor|
      sensor_series_data = []
      time_stamp_hash.each_pair do |time_stamp, value_pairs|
        unless value_pairs[sensor.id].nil?
          sensor_series_data.push "["+ (time_stamp*1000+7200*1000).to_s + ", " + value_pairs[sensor.id].to_s + "]"
        end
      end
      new_series = "{
      name: '#{sensor.label + " [" + sensor.unit + "]"}',
      type: 'spline',
      yAxis: #{unit_sensor_hash[sensor.unit]},
      data: [#{sensor_series_data.join(', ')}],
      tooltip: {
        valueSuffix: ' #{sensor.unit}'
      }
      }"
      series_array.push new_series
    end
    "[" + series_array.join(', ') + "]"
  end
end