class Api::V1::RoadTripController < ApplicationController
  def create
    # if api_key == user.api_key
      # do the things
    # else
      # say your credentials are invalid
    # end
    long_and_lat = MapquestFacade.get_location(params[:destination])
    returned_weather = ForecastFacade.weather_by_category(long_and_lat)
    travel_time = RoadTripFacade.make_a_road_trip(params[:origin], params[:destination])
    
    calculated_weather = WeatherCalculator.new(travel_time, returned_weather)
    calculated_weather.figure_out_weather
  end


end