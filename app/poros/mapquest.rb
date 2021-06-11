class Mapquest
  attr_reader :latitude, :longitude 

  def initialize(mapquest_info)
    @latitude = mapquest_info[:results][0][:locations][0][:latLng][:lat]
    @longitude = mapquest_info[:results][0][:locations][0][:latLng][:lng]
  end
end