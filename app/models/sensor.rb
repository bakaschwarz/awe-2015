class Sensor < ActiveRecord::Base
  has_many :sensor_data
  belongs_to :visualization_type

  @sensor = Sensor.first
  @sensor.sensor_data
end
