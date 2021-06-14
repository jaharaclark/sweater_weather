class BookSearchFacade
  def self.ask_for_book(city_and_state, amount)
    returned_book_list = BookSearchService.get_requested_books(city_and_state, amount)
    books_to_read = returned_book_list[:docs][0..5].map do |book|
      BookSearch.new(book)
    end
    count_of_returned_books = BookCount.new(returned_book_list)
    ReadingList.new(books_to_read, count_of_returned_books)
  end
end