class Api::V1::BookSearchController < ApplicationController
  def index
    book_list = BookSearchFacade.ask_for_book(params[:location], params[:quantity])
    require 'pry'; binding.pry
  end
end