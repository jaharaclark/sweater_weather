class DailyWeatherSerializer
  include JSONAPI::Serializer
  attributes :date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon
end
