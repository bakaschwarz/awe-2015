class StaticPagesController < ApplicationController
  before_action :authenticate_user!

  def dashboard
  end

  def wetter_config
    @sensors = Sensor.all
  end

end
