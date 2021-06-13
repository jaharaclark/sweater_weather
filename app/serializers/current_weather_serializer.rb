class CurrentWeatherSerializer
  include JSONAPI::Serializer
  attributes :datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon
end
