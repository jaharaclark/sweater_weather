class RoadTripFacade
  def self.make_a_road_trip(beginning, ending)
    distance_between = MapquestService.calc_distance(beginning, ending)
    RoadTrip.new({
      starting_location: beginning,
      ending_location: ending,
      travel_time: distance_between[:route][:realTime],
      longitude: distance_between[:route][:boundingBox][:ul][:lng],
      latitude: distance_between[:route][:boundingBox][:ul][:lat]
      })
      # require 'pry'; binding.pry
    # if xxx < 28800
    #   hourly_weather_info(xxx)
  end

end

# weather time eta is gonig to be a method, pass in real time longitude and latitude 
# it'll be multiple methods, define the amount of time, other methods are going to build weather at eta