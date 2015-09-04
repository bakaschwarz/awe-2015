class WeatherUpdateController < ApplicationController

  def create
    token = params[:api_token]
    if token == ApiToken.first.token
      sensor_data_params.each do |data_set|
        data_set = data_set.permit(:timestamp, :sensor_id, :value)
        sensor_datum = SensorDatum.new(data_set)
        sensor_datum.save
      end
    render status: 204, text: ""
    else
      render status: 403, text: ""
    end
  end

  private
    def sensor_data_params
      params.require(:s_d)
    end
end
