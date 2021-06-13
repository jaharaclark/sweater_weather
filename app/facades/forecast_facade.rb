class ForecastFacade
  def self.weather_by_category(weather_metrics)
    upcoming_weather = ForecastService.return_forecast(weather_metrics)
    current_weather = CurrentWeather.new(upcoming_weather[:current])
    hourly_weather = upcoming_weather[:hourly][0..7].map do |hourly_data|
      HourlyWeather.new(hourly_data)
    end
    daily_weather = upcoming_weather[:daily][0..4].map do |daily_data|
      DailyWeather.new(daily_data)
    end
    Forecast.new(current_weather, daily_weather, hourly_weather)
  end
end
