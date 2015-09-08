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
    @stations = Station.all
    @sensors = Sensor.all
  end

  def line_chart
    @sensor_data = SensorDatum.all
    @sensors = Sensor.all
  end

  def reload_dashboard
    render partial: 'static_pages/dashboard_tables', locals: {filter_from: params[:filter_from], filter_to: params[:filter_to]}
  end



end
