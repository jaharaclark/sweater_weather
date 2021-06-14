class ReadingListSerializer
  include JSONAPI::Serializer
  attributes :number_of_books, :book_information
end
