class MapquestService
  def self.request_location(here)
    response = conn.get("geocoding/v1/address?") do |request|
      request.params = {key: ENV['mapquest_api'], location: here}
    end
    parse_response(response)
  end

  def self.calc_distance(from,to)
    response = conn.get("directions/v2/route") do |request|
      request.params = {key: ENV['mapquest_api'], from: from, to: to}
    end
    parse_response(response)
  end

  private
  def self.conn
    Faraday.new("http://mapquestapi.com")
  end

  def self.parse_response(response)
    JSON.parse(response.env.response_body, symbolize_names: true)
  end
end