class BookSearch
  attr_reader :isbn, :title, :publisher
  def initialize(list_of_books)
    @isbn = list_of_books[:isbn]
    @title = list_of_books[:title]
    @publisher = list_of_books[:publisher]
  end
end

