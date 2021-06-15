require 'rails_helper'

RSpec.describe "User", type: :request do
 describe "it has happy paths" do
   it "creates a user in the database and generates an api key" do
     
    post "/api/v1/users", params:{ email: "user@test.com", 
                          password: "word1234", 
                          password_confirmation: "word1234"}

    expect(response).to be_successful
    expect(response.status).to eq(201)
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    user = User.last
    expect(parsed_response[:data][:attributes][:email]).to eq(user.email)
    expect(parsed_response[:data][:attributes][:api_key]).to eq(user.api_key)
   end
  end
  describe "it has sad paths" do 
   it "renders an error when passwords don't match" do
      post "/api/v1/users", params:{email: "user@test.com",
                            password: "word", 
                            password_confirmation: "word"}
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_response[:errors]).to eq("Password is too short (minimum is 8 characters)")
   end

   it "renders an error when passwords have less than 8 characters" do
      post "/api/v1/users", params:{email: "user@test.com",
                            password: "word", 
                            password_confirmation: "word"}
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_response[:errors]).to eq("Password is too short (minimum is 8 characters)")
   end

    it "renders an error when the email is blank" do
      post "/api/v1/users", params:{email: "",
                            password: "word1234", 
                            password_confirmation: "word1234"}
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_response[:errors]).to eq("Email can't be blank and Email is invalid")
    end
    
    it "renders an error when the email is nil" do
      post "/api/v1/users", params:{email: nil,
      password: "word1234", 
      password_confirmation: "word1234"}
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_response[:errors]).to eq("Email can't be blank and Email is invalid")
    end 
      
      it "renders an error when the email is invalid" do
        post "/api/v1/users", params:{email: "user",
        password: "word1234", 
        password_confirmation: "word1234"}
        expect(response).to_not be_successful
        expect(response.status).to eq(400)
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(parsed_response[:errors]).to eq("Email is invalid")
    end 

    it "renders an error when the email has already been taken" do
      User.destroy_all
      user = User.create!(email: "user@test.com", 
                          password: "word1234", 
                          password_confirmation: "word1234")
      post "/api/v1/users", params:{email: "user@test.com",
                            password: "word1234", 
                            password_confirmation: "word1234"}
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_response[:errors]).to eq("Email has already been taken")
    end
  end
end