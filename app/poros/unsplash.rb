class Unsplash
  attr_reader :id, :image_url, :photographer, :photographer_url, :unsplash, :unsplash_url
  def initialize(weather_image)
    @id = nil
    @image_url = weather_image[:results].first[:urls][:regular]
    @photographer = weather_image[:results].first[:user][:name]
    @photographer_url = weather_image[:results].first[:user][:links][:portfolio]
    @unsplash = "Unsplash"
    @unsplash_url = "https://unsplash.com/"
  end
end