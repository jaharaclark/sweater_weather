class HourlyWeatherSerializer
  include JSONAPI::Serializer
  attributes :time, :temperature, :conditions, :icon
end
