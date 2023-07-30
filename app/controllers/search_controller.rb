class SearchController < ApplicationController
  def index
    @station = FuelFacade.new.get_station(params[:location])
    @directions = DirectionsFacade.new.get_directions((params[:location]), @station.address)
  end
end
