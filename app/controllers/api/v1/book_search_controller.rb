class Api::V1::BookSearchController < ApplicationController
  def index
    book_list = BookSearchFacade.ask_for_book(params[:location], params[:quantity])
    render json: ReadingListSerializer(book_list)
  end
end