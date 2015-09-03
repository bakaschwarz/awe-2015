class WeatherUpdateController < ApplicationController

  def create
    token = params[:weather_update][:api_token]
    if token == ApiToken.first.token
      sensor_datum = SensorDatum.new(sensor_data_params)
      sensor_datum.save
    render status: 204, text: ""
    else
      render status: 403, text: ""
    end
  end

  private
    def sensor_data_params
      params.require(:weather_update).permit(:node, :sensor_id, :value, :timestamp)
    end
end
