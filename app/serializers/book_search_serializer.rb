class BookSearchSerializer
  include JSONAPI::Serializer
  attributes :isbn, :title, :publisher
end
