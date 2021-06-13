require 'rails_helper'

RSpec.describe 'Weather', type: :request do
    it 'returns:
    a data attribute, under which all other attributes are present:
      - id, always set to null
      - type, always set to “forecast”
    attributes, an object containing weather information:' do
    long_and_lat = MapquestFacade.get_location("denver,co")
    returned_weather = ForecastFacade.weather_by_category(long_and_lat)

    get "/api/v1/forecast?",params:{location: "denver,co"}, headers:{"Content-Type": "application/json", "Accept": "application/json"}
    expect(response).to be_successful

      
      # expect application json content type?
      # expect parse data class is a hash?
      # expect(response[:data][:id]).to eq("null" || nil)
      expect(response[:data][:type]).to eq("forecast")
      expect(response[:data][:attributes].first).to eq("current_weather")
      expect(response[:data][:attributes].second).to eq("daily_weather")
      expect(response[:data][:attributes].third).to eq("hourly_weather")
      expect(response[:data][:attributes].keys.length).to eq(3)
      # take 16 - 18 and equate the keys to an array on one, two and three
      # take the keys for each attribute are the length they are supposed to be eg - current_weather.length = 10 - also put them in an array like comment on 20
  end
end