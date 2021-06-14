class ReadingList
  attr_reader :id, :number_of_books, :book_information
  def initialize(book_count, book_search)
    @id = nil
    @number_of_books = book_count
    @book_information = book_search
  end
end