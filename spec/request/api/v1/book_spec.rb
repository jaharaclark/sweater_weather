require 'rails_helper'

RSpec.describe 'Book', type: :request do
  it 'returns:
      - the destination city
      - the forecast in that city right now
      - the total number of search results found
      - a quantity of books about the destination city' do

    get "/api/v1/book-search?location=denver,co&quantity=5"
  
    expect(response).to be_successful
    # parsed_response = JSON.parse(response.body, symbolize_names: true )
  end
end 
