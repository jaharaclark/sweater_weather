class BookCount
  attr_reader :book_total
  def initialize(list_of_books)
    require 'pry'; binding.pry
    @book_total = list_of_books[:numFound]
  end
end