class RoadTripSerializer
  include JSONAPI::Serializer
  attributes :start_city, :end_city, :current_temp, :current_conditions
end
