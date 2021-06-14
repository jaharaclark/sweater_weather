class BookCount
  attr_reader :book_total
  def initialize(list_of_books)
    @book_total = list_of_books[:numFound]
  end
end