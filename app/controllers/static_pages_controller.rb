class StaticPagesController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @sensor_data = SensorDatum.order('sensor_data.time_stamp DESC').all
  end

  def wetter_config
    @sensors = Sensor.all
    @visualization_types = VisualizationType.all
  end

end
