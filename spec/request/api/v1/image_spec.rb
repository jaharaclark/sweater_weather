require 'rails_helper'

RSpec.describe 'Image', type: :request do
  it 'returns: a background image for that page showing the city' do
    get "/api/v1/backgrounds?", params:{location: "denver,co"}, headers:{"Content-Type": "application/json", "Accept": "application/json"}
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(parsed_response.class).to be(Hash)
    expect(parsed_response[:data][:id]).to eq(nil)
    expect(parsed_response[:data][:type]).to eq("unsplash")
    expect(parsed_response[:data][:attributes].keys.length).to eq(5)
    expect(parsed_response[:data][:attributes].keys).to eq([:image_url, :photographer, :photographer_url, :unsplash, :unsplash_url])
  end
end