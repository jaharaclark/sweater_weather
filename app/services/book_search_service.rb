class BookSearchService
  def self.get_requested_books(location_for_book, amount)
    response = conn.get("search.json") do |request|
      request.params['q'] = location_for_book
      request.params['limit'] = amount
    end
    parse_response(response)
    require 'pry'; binding.pry
  end

  private
  def self.conn
    Faraday.new("http://openlibrary.org")
  end

  def self.parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
