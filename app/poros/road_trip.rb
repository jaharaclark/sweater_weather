class RoadTrip
  attr_reader :id, :travel_time, :start_city, :end_city, :current_temp, :current_conditions

  def initialize(data)
    @id = nil
    @travel_time = data[:travel_time]
    @start_city = data[:starting_location]
    @end_city = data[:ending_location]
    @current_temp = data[:weather][:current][:temp]
    @current_conditions = data[:weather][:current][:weather].first[:description]
  end
end
