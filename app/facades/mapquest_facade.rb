class MapquestFacade
  def self.get_location(place)
    location = MapquestService.request_location(place)
    returned_lat_and_long = Mapquest.new(location)
  end
end