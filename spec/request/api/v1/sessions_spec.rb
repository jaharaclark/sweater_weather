require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "it has happy paths" do
    it "can return a user's api key" do
      post "/api/v1/sessions", params:{email: "user@test.com",
                                       password: "word1234"}
      expect(response).to be_successful
      
    end
  end
end