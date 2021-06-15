require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "it has happy paths" do
    it "can return a user's api key" do
      User.destroy_all
      user = User.create!(email: "user@test.com", 
                          password: "word1234", 
                          password_confirmation: "word1234")
      post "/api/v1/sessions", params:{email: "user@test.com",
                                       password: "word1234"}
      expect(response).to be_successful
      expect(response.status).to eq(200)
    end
  end

  describe "it has sad paths" do
    it "won't return a user's api key without proper credentials" do
      User.destroy_all
      user = User.create!(email: "user@test.com", 
                          password: "word1234", 
                          password_confirmation: "word1234")
      post "/api/v1/sessions", params:{email: "user@test.com",
                                        password: "word12345"}
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(response.body).to eq("email and/or password are incorrect")
    end

     it "won't return a user's api key if a user doesn't exist" do
      User.destroy_all
      post "/api/v1/sessions", params:{email: "user@test.com",
                                        password: "word12345"}
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(response.body).to eq("email and/or password are incorrect")
    end
  end
end