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

  def update_main_diagram_id
    respond_to do |format|
      puts " -- MainDiagramInfo --"
      main_diagram_id = main_diagram_info["main_diagram_id"]

      main_diagram_info["show"].each do |sensor_id|
        Sensor.find(sensor_id).update_attributes(main_diagram_id: main_diagram_id)
        puts "Sensor id: " + sensor_id.to_s
      end

      main_diagram_info["notshow"].each do |sensor_id|
        Sensor.find(sensor_id).update_attributes(main_diagram_id: nil)
        puts "Sensor id: " + sensor_id.to_s
      end

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

     # Never trust parameters from the scary internet, only allow the white list through.
    def main_diagram_info
      params.require(:main_diagram_info)
    end

end