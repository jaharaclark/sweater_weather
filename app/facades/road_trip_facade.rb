class RoadTripFacade
  def self.make_a_road_trip(beginning, ending)
    distance_between = MapquestService.calc_distance(beginning, ending)
    destination = MapquestService.request_location(ending)
    returned_lat_and_long = Mapquest.new(destination)
    substitute_weather = ForecastService.return_forecast(returned_lat_and_long)
    RoadTrip.new({
      starting_location: beginning,
      ending_location: ending,
      travel_time: distance_between[:route][:formattedTime],
      weather: substitute_weather
      })
  
  end
end