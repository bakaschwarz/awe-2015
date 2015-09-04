class StaticPagesController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @stations = Station.all
    @sensors = Sensor.all
    @sensor_data = SensorDatum.order('sensor_data.time_stamp DESC').all
  end

  def dashboard_basic
    @sensor_data = SensorDatum.order('sensor_data.time_stamp DESC').all
  end

  def wetter_config
    @sensors = Sensor.all
  end

end
