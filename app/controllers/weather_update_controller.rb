class WeatherUpdateController < ApplicationController

  def create
    token = params[:api_token]
    if token == ApiToken.first.token
      sensor_data_params.each do |data_set|
        data_set[:sensor_id] = Sensor.find_by_abbreviation(data_set[:abbreviation]).id
        data_set = data_set.permit(:time_stamp, :sensor_id, :value)
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
