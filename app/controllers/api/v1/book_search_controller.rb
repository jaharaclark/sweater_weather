class Api::V1::BookSearchController < ApplicationController
  def index
    book_list = BookSearchFacade.ask_for_book(params[:location], params[:quantity])
    long_and_lat = MapquestFacade.get_location(params[:location])
    returned_weather = ForecastFacade.weather_by_category(long_and_lat)
    render json: ReadingListSerializer.new(book_list)
  end
end