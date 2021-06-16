class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: road_trip_params[:api_key])
    if user
      if road_trip_params[:origin].blank? || road_trip_params[:destination].blank? 
        render json: "Your origin or destination is blank.", status: 400
      else 
        trip = RoadTripFacade.make_a_road_trip(road_trip_params[:origin],road_trip_params[:destination])
        render json: RoadTripSerializer.new(trip), status: 200
      end
    else
      render json: "Your credentials are invalid.", status: 400
    end
  end

  private
  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end

end