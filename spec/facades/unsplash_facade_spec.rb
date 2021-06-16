require 'rails_helper'

RSpec.describe UnsplashFacade, type: :model do
  describe "it has happy paths" do
    it "can return an image hash" do
      location_picture = UnsplashService.picture_of_weather_in_location("Seattle,WA")
      expect(location_picture).to be_a(Hash)
    end
  end
end