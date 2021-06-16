require "rails_helper"

RSpec.describe CurrentWeather, type: :model do
  describe "it can have attributes" do
    it "has attributes" do  
      long_and_lat = MapquestFacade.get_location("Seattle,WA")
      returned_weather = ForecastFacade.weather_by_category(long_and_lat)
      require 'pry'; binding.pry
      current_weather = CurrentWeather.new(returned_weather.current_weather)
    end
  end
end