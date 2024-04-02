class HomeController < ApplicationController
  # GET /
  def index
    gardiner_stop = Requests::Stops.stop(stop_id: Ptv::GARDINER_STOP, route_type: Ptv::TRAIN_TYPE)
    belmont_stop = Requests::Stops.stop(stop_id: Ptv::BELMONT_AVE_STOP, route_type: Ptv::TRAM_TYPE)

    @options = [
      OpenStruct.new(
        stop: gardiner_stop,
        departures: Requests::Departures.departures(
          stop: gardiner_stop,
          route_id: Ptv::GLEN_WAVERLEY_LINE,
          direction_id: Ptv::CITYBOUND_DIRECTION
        ),
      ),
      OpenStruct.new(
        stop: belmont_stop,
        departures: Requests::Departures.departures(
          stop: belmont_stop,
          route_id: Ptv::ROUTE_6_LINE,
          direction_id: Ptv::MORELAND_DIRECTION
        ),
      ),
    ]
  end
end
