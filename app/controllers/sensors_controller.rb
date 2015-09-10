class SensorsController < ApplicationController
  before_action :authenticate_user!, :set_sensor, only: [:show, :update, :destroy]

  def index
    redirect_to static_pages_wetter_config_path
  end

  def show # Show is also for editing
  end

  def create
    @sensor = Sensor.new(sensor_params)
    if @sensor.save
      redirect_to static_pages_wetter_config_path
    else
      flash[:danger] = "Illegal Input"
      render 'new'
    end
  end

  def new
    @sensor = Sensor.new
  end

  def update
    if @sensor.update(sensor_params)
      redirect_to static_pages_wetter_config_path
    else
      flash[:danger] = "Illegal Input"
      redirect_to = sensor_path(@sensor)
    end
  end

  def destroy
    id = @sensor.id
    @sensor.destroy

    @sensor.sensor_data.each do |datum|
      datum.destroy
    end

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