class RoadTrip
  attr_reader :time_to_arrival, :starting_location, :ending_location, :longitude, :latitude
  
  def initialize(data)
    @id = nil
    @time_to_arrival = data[:travel_time]
    @starting_location = data[:starting_location]
    @ending_location = data[:ending_location]
    @longitude = data[:longitude]
    @latitude = data[:latitude]
  end
end
