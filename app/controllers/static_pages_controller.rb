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
    from = Time.parse(params[:filter_from]).to_i
    to = Time.parse(params[:filter_to]).to_i
    render partial: 'static_pages/dashboard_tables', locals: {filter_from: from, filter_to: to}
  end

  def update_defaults

  end

end
