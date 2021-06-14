class BookSearchFacade
  def self.ask_for_book(city_and_state, amount)
    returned_book_list = BookSearchService.get_requested_books(city_and_state, amount)
    books_to_read = returned_book_list[:docs][0..5].map do |book|
      BookSearch.new(book)
    end
  end
end