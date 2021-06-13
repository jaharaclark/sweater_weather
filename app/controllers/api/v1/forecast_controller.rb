class Api::V1::ForecastController < ApplicationController
  def index
    long_and_lat = MapquestFacade.get_location(params[:location])
    returned_weather = ForecastFacade.weather_by_category(long_and_lat)
    require 'pry'; binding.pry
    render json: ForecastSerializer.new(returned_weather)
  end
end