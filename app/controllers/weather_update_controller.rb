class WeatherUpdateController < ApplicationController

  def create
    token = params[:api_token]
    if token == ApiToken.first.token
      sensor_data_params.each do |data_set|
        data_set.each_pair do |sensor, value|
          if sensor != "_t" && sensor != "_n"
            sensor_id = nil

            #Create new Station if it is non existent
            begin
              station = Station.find_by_node_number(data_set["_n"])
              station_id = station.id
            rescue
              new_station = Station.new(
                                       node_number: data_set["_n"],
                                       description: "N/A",
                                       label: "N/A",
                                       index_dashboard: Station.order('stations.index_dashboard DESC').first.index_dashboard+1
              )
              new_station.save
              station = new_station
              station_id = new_station.id
            end


            # Create new Sensor if it is non existent
            begin
              sensor_id = station.sensors.find_by_abbreviation(sensor).id
            rescue
              new_sensor = Sensor.new(
                  abbreviation: sensor,
                  station_id: station_id,
                  visualization_type_id: VisualizationType.first.id,
                  label: "N/A",
                  unit: "N/A",
                  sensor: "N/A"
              )
              new_sensor.save
              sensor_id = new_sensor.id
            end

            new_datum = SensorDatum.new(
                           time_stamp:  data_set["_t"],
                           sensor_id:   sensor_id,
                           value:       value
            )
            new_datum.save
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
