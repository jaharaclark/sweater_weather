require 'rails_helper'

RSpec.describe MapquestFacade, type: :model do
  describe "it has happy paths" do
    it "can return map information" do
      location_data = MapquestFacade.get_location("Seattle,WA")
      expect(location_data.latitude).to eq(47.603229)
      expect(location_data.longitude).to eq(-122.33028)
    end
  end
end