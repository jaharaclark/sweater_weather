class WeatherCalculator
  attr_reader :drivetime, :weather
  def initialize(time, weather)
    @drivetime = time.time_to_arrival
    @weather = weather
  end

  def figure_out_weather
    if @drivetime < 28800
      hourly_calculator
    elsif @drivetime > 28800 && @drivetime < 432000
      daily_calculator
    else
      return "You can't drive that far in the continental US."
    end
  end
  
  def hourly_calculator
    weather.current_weather.datetime
  end
  
  def daily_calculator
    weather.current_weather.datetime.to_datetime.strftime('%s').to_i + @drivetime
  end
end


# calculate projected time of arrival
# round to nearest :00
# find weather at that time