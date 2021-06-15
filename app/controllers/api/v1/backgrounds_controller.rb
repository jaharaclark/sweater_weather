class Api::V1::BackgroundsController < ApplicationController
  def index
    returned_picture = UnsplashFacade.get_weather_picture(params[:location])
    background_image = UnsplashSerializer.new(returned_picture)
    render json: background_image, status: 200
  end
end