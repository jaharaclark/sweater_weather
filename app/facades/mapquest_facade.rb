class MapquestFacade
  def self.get_location(place)
    location = MapquestService.request_location(place)
    require 'pry'; binding.pry
    returned_lat_and_long = Mapquest.new(location)
  end
end