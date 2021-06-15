class UnsplashFacade
  def self.get_weather_picture(location)
    location_picture = UnsplashService.picture_of_weather_in_location(location)
    returned_image = Unsplash.new(location_picture)
  end
end