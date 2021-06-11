class ForecastService
  def self.return_forecast(mapquest_poro)
    response = conn.get()
    parse_response(response)
  end

  private
  def self.conn
    Faraday.new()
  end

  def parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end