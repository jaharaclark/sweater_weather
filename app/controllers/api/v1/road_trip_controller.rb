class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    require 'pry'; binding.pry
    roadtrip = RoadTripFacade.get_info(params[:origin], params[:destination])
  end


end