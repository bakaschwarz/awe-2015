class SensorsController < ApplicationController
  before_action :authenticate_user!, :set_sensor, only: [:show, :update, :destroy]

  def index
    redirect_to static_pages_wetter_config_path
  end

  def show
  end

  def update
    if @sensor.update(sensor_params)
      redirect_to static_pages_wetter_config_path
    else
      # handle unsucessful update
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sensor
      @sensor = Sensor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sensor_params
      params.require(:sensor).permit(:label, :unit, :visualization_type_id, :sensor, :active, :abbrevation)
    end

end