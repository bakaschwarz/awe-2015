class DashboardPositionsController < ApplicationController

  # PATCH/PUT /dashboard_positions.json
  def update
    respond_to do |format|

      # because not all stations might be rendered we have to be cautios with assigning the dashboard_positions
      # thus, we first reset all positions, then assign the positions to the rendered stations and lastly add positions to the remaining

      # 1. reset all
      Station.all.each do |station|
        station.update_attributes(dashboard_position: 999)
      end
      # 2. set according to view
      positions.each_with_index do |p, index|
        puts " -- DashboardPositions --"
        puts p
        puts p['station_id']
        puts "index: " + index.to_s
        Station.find_by(id: p['station_id']).update_attributes(dashboard_position: index)
      end

      # 3. set rest
      index = positions.count
      Station.all.each do |station|
        if station.dashboard_position == 999
          station.update_attributes(dashboard_position: index)
          index = index + 1
        end
      end

      format.json { head :no_content }
    end
  end

  private
     # Never trust parameters from the scary internet, only allow the white list through.
    def positions
      params.require(:stations_reduced)
    end
end