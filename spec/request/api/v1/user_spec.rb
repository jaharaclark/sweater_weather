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
                            password: "word1234", 
                            password_confirmation: "word"}
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_response[:errors]).to eq("Password confirmation is too short (minimum is 8 characters)")
   end

   it "renders an error when passwords have less than 8 characters" do
      post "/api/v1/users", params:{email: "user@test.com",
                            password: "word", 
                            password_confirmation: "word"}
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_response[:errors]).to eq("Password is too short (minimum is 8 characters) and Password confirmation is too short (minimum is 8 characters)")
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

# This POST endpoint should NOT call your endpoint like /api/v1/users?email=person@woohoo.com&password=abc123&password_confirmation=abc123, and should NOT send as form data either. You must send a JSON payload in the body of the request
    # in Postman, under the address bar, click on “Body”, select “raw”, which will show a dropdown that probably says “Text” in it, choose “JSON” from the list
    # this is a hard requirement to pass this endpoint!
# A successful request creates a user in your database, and generates a unique api key associated with that user, with a 201 status code. The response should NOT include the password in any form
# An unsuccessful request returns an appropriate 400-level status code and body with a description of why the request wasn’t successful.
  # Potential reasons a request would fail: passwords don’t match, email has already been taken, missing a field, etc.


# make a post request to the endpoint, making sure it's properly formatted
# happy path: successful request 1) creates a user, 2) generates a key, 3) has status 201 code (don't include password)
# sad path: unsuccessful request 1) returns 400 and explains why not successful 



# post to /users - it number 1
# send error if invalid credentials in post  - there are status codes and status messages