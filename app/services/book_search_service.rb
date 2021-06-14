class BookSearchService
  def self.get_requested_books(location_for_book, amount)
    require 'pry'; binding.pry
  end

  private
  def self.conn
    Faraday.new("http://openlibrary.org/")
  end

  def self.parse_response(response)
    JSON.parse_response(response.body, symbolize_names: true)
  end
end
