require 'rails_helper'

RSpec.describe ForecastFacade, type: :model do
  describe "it has happy paths" do
    it "can create a forecast" do
      long_and_lat = MapquestFacade.get_location("Seattle,WA")
      forecast = ForecastFacade.weather_by_category(long_and_lat)
      expect(forecast.daily_weather.length).to eq(5)
      expect(forecast.hourly_weather.length).to eq(8)
    end
  end
end