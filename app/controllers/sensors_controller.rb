class SensorsController < ApplicationController
  before_action :authenticate_user!, :set_sensor, only: [:show, :update, :destroy]
  before_save :default_values

  def default_values
    self.visualization_type_id ||= VisualizationTypes.first.id
    self.label = "N/A"
    self.unit = "N/A"
    self.sensor = "N/A"
  end

  def index
    redirect_to static_pages_wetter_config_path
  end

  def show # Show is also for editing
  end

  def destroy
  end

  def create
    @sensor = Sensor.new(sensor_params)
    if @sensor.save
      redirect_to static_pages_wetter_config_path
    else
      #handle unsuccessful create
    end
  end

  def new
    @sensor = Sensor.new
  end

  def update
    if @sensor.update(sensor_params)
      redirect_to static_pages_wetter_config_path
    else
      # handle unsucessful update
    end
  end

  def destroy
    @sensor.destroy
    respond_to do |format|
      format.html { redirect_to static_pages_wetter_config_path, notice: 'Sensor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sensor
      @sensor = Sensor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sensor_params
      params.require(:sensor).permit(:label, :unit, :visualization_type_id, :sensor, :active, :abbreviation, :station_id)
    end

end