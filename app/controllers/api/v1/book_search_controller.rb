class Api::V1::BookSearchController < ApplicationController
  def index
    book_list = BookSearchFacade.ask_for_book(params[:location])
  end
end