class WeatherUpdateController < ApplicationController

  def create
    token = params[:api_token]
    if token == ApiToken.first.token
      sensor_data_params.each do |data_set|
        data_set.each_pair do |sensor, value|
          unless sensor == "_t"

            SensorDatum.create(
                           time_stamp:  data_set["_t"],
                           sensor_id:   Sensor.find_by_abbreviation(sensor).id,
                           value:       value
            )
          end
        end
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
