class UnsplashService
  def self.picture_of_weather_in_location(location_info)
    response = conn.get("search/photos") do |request|
      request.params['client_id'] = ENV['unsplash_api']
      request.params['query'] = location_info
      request.params['per_page'] = 1
    end
    parse_response(response)
  end

  private
  def self.conn
    Faraday.new("https://api.unsplash.com")
  end

  def self.parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end