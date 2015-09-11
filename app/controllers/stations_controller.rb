class StationsController < ApplicationController
  before_action :authenticate_user!, :set_station, only: [:show, :update, :destroy]

  def index
    redirect_to static_pages_wetter_config_path
  end

  def show # Show is also for editing
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      flash[:success] = "Station #{@station.label} was successfully created."
      redirect_to static_pages_wetter_config_path
    else
      flash[:danger] = "Illegal Input"
      render 'new'
    end
  end

  def new
    @station = Station.new
  end

  def update
    if @station.update(station_params)
      flash[:success] = "Station #{@station.label} was successfully updated."
      redirect_to static_pages_wetter_config_path
    else
      flash[:danger] = "Illegal Input"
      redirect_to station_path(@station)
    end
  end

  def destroy
    @station.destroy
    @station.sensors.each do |sensor|
      sensor.destroy
    end

    respond_to do |format|
      format.html { redirect_to static_pages_wetter_config_path, notice: 'Station was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def station_params
      params.require(:station).permit(:label, :description, :node_number, :dashboard_position)
    end
end
