class Api::V1::ForecastController < ApplicationController
  def index
    long_and_lat = MapquestFacade.get_location(params[:location])
  end
end