class BookSearchFacade
  def self.ask_for_book(city_and_state, amount)
    returned_book_list = BookSearchService.get_requested_books(city_and_state, amount)
    require 'pry'; binding.pry
    books_to_read = BookSearch.new(returned_book_list)
  end
end