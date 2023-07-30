class DirectionsFacade
  def get_directions(address1, address2)
    service = DirectionsService.new
    request = service.directions(address1, address2)
    directions = Directions.new(request)
  end
end
