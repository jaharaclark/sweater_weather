class ForecastService
  def self.return_forecast(mapquest_poro)
    response = conn.get("data/2.5/onecall") do |request|
      request.params['lat'] = mapquest_poro.latitude
      request.params['lon'] = mapquest_poro.longitude
      request.params['exclude'] = "minutely,alerts"
      request.params['units'] = "imperial"
      request.params['appid'] = ENV['open_weather_api']
    end
    parse_response(response)
  end

  private
  def self.conn
    Faraday.new("https://api.openweathermap.org")
  end

  def self.parse_response(response)
    JSON.parse(response.env.response_body, symbolize_names: true)
  end
end