class FuelFacade
  def get_station(address)
    service = FuelService.new
    request = service.nearest_station(address)
    station = Fuel.new(request)
  end
end
