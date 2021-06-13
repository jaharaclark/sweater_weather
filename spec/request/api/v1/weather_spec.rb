require 'rails_helper'

RSpec.describe 'Weather', type: :request do
    it 'returns:
    a data attribute, under which all other attributes are present:
      - id, always set to null
      - type, always set to “forecast”
    attributes, an object containing weather information:' do

    get "/api/v1/forecast?",params:{location: "denver,co"}, headers:{"Content-Type": "application/json", "Accept": "application/json"}
   
    expect(response).to be_successful
    parsed_response = JSON.parse(response.body, symbolize_names: true )

    expect(parsed_response.class).to eq(Hash)
    expect(parsed_response[:data][:id]).to eq(nil)
    expect(parsed_response[:data][:type]).to eq("forecast")
    expect(parsed_response[:data][:attributes].keys).to eq([:current_weather, :hourly_weather, :daily_weather])
    expect(parsed_response[:data][:attributes].keys.length).to eq(3)
    expect(parsed_response[:data][:attributes][:current_weather].keys).to eq([:datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon])
    expect(parsed_response[:data][:attributes][:daily_weather].first.keys).to eq([:date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon])
    expect(parsed_response[:data][:attributes][:hourly_weather].first.keys).to eq([:time, :temperature, :conditions, :icon])
  end
end