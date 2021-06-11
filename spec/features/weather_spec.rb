require 'rails_helper'

RSpec.describe 'Weather', type: :feature do
    it 'returns:
    a data attribute, under which all other attributes are present:
      - id, always set to null
      - type, always set to “forecast”
    attributes, an object containing weather information:' do

    get "/api/v1/forecast?",params:{location: denver,co}, headers:{"Content-Type": "application/json", "Accept": "application/json"}
    expect(response).to be_successful
    expect(response[:data][:id]).to eq("null" || "nil")
    expect(response[:data][:type]).to eq("forecast")
    expect(response[:data][:attributes].first).to eq("current_weather")
    expect(response[:data][:attributes].second).to eq("daily_weather")
    expect(response[:data][:attributes].third).to eq("hourly_weather")
    expect(response[:data][:attributes].keys.length).to eq(3)
    end
  end
end