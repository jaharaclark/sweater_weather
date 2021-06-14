require 'rails_helper'

RSpec.describe 'Book', type: :request do
  it 'returns:
      - the destination city
      - the forecast in that city right now
      - the total number of search results found
      - a quantity of books about the destination city' do

    get "/api/v1/forecast?",params:{location: "denver,co"}, headers:{"Content-Type": "application/json", "Accept": "application/json"}
    expect(response).to be_successful
  

    get "/api/v1/book-search?location=denver,co&quantity=5"
    expect(response).to be_successful
    parsed_response = JSON.parse(response.body, symbolize_names: true )
    expect(parsed_response.class).to eq(Hash)
    expect(parsed_response[:data][:id]).to eq(nil)
    expect(parsed_response[:data][:type]).to eq("reading_list")
    expect(parsed_response[:data][:attributes].keys).to eq([:number_of_books, :book_information])
    expect(parsed_response[:data][:attributes][:number_of_books].first.keys).to eq([:isbn, :title, :publisher])
    expect(parsed_response[:data][:attributes][:book_information].keys).to eq([:book_total])
  end
end 
