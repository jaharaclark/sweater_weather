class BookWeatherSerializer
  include JSONAPI::Serializer
  attributes :current_weather
end
