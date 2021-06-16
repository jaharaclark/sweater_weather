require 'rails_helper'

RSpec.describe "Road Trip", type: :request do
  describe "it has happy paths" do
    it "returns: 
      - a data attribute, under which all other attributes are present:
        - id, always set to null
        - type, always set to “roadtrip”
      - attributes, an object containing road trip information:
        - start_city, string, such as “Denver, CO”
        - end_city, string, such as “Estes Park, CO”
        - travel_time, string, something user-friendly like “2 hours, 13 minutes” or “2h13m” or “02:13:00” or something of that nature (you don’t have to include seconds); set this string to “impossible route” if there is no route between your cities
        - weather_at_eta, conditions at end_city when you arrive (not CURRENT weather), object containing:
          - temperature, numeric value in Fahrenheit
          - conditions, string, as given by OpenWeather
          - note: this object will be blank if the travel time is impossible" do
    
      User.destroy_all
      user = User.create!(email: "user@test.com", 
                          password: "word1234", 
                          api_key: "83c09ffb83ed5507280e4d206e82664a")
      post "/api/v1/road_trip", params: {origin: "Denver,CO",
                                        destination: "Seattle,WA",
                                        api_key: user.api_key}
      expect(response).to be_successful
      expect(response.status).to eq(200)
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_response[:data][:type]).to eq("road_trip")
      expect(parsed_response[:data][:attributes][:start_city]).to eq("Denver,CO")
      expect(parsed_response[:data][:attributes][:end_city]).to eq("Seattle,WA")
    end
  end

  describe "it has sad paths" do
    it "returns an error if there is no user" do
      post "/api/v1/road_trip", params: {origin: "Denver,CO",
                                        destination: "Seattle,WA"}
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(response.body).to eq("Your credentials are invalid.")
    end

    it "returns an error if the origin is blank" do
      User.destroy_all
      user = User.create!(email: "user@test.com", 
                          password: "word1234", 
                          api_key: "83c09ffb83ed5507280e4d206e82664a")
      post "/api/v1/road_trip", params: {destination: "Seattle,WA",
                                        api_key: user.api_key}
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(response.body).to eq("Your origin or destination is blank.")
    end
    
    it "returns an error if the destination is blank" do
      User.destroy_all
      user = User.create!(email: "user@test.com", 
                          password: "word1234", 
                          api_key: "83c09ffb83ed5507280e4d206e82664a")
      post "/api/v1/road_trip", params: {origin: "Seattle,WA",
                                        api_key: user.api_key}
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(response.body).to eq("Your origin or destination is blank.")
    end
  end
end