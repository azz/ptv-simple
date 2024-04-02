class Requests::Departures < Requests::Base
  def self.departures(...) = new.departures(...)

  def departures(stop:, route_id:, direction_id:)
    departures = client.departures_for_route(
      stop.route_type,
      stop.stop_id,
      route_id,
      {
        direction_id:,
        max_results: 3,
        include_cancelled: false,
        # expand: 'Disruption',
      }
    ).fetch('departures')

    directions = client.directions_for_route_type(direction_id, stop.route_type)

    departures.map do |departure|
      direction = directions.find { _1['route_id'] == departure['route_id'] }
      Departure.from_hash({**departure, 'direction' => direction})
    end
  end

  # def belmont_departures
  #   departures = client.departures_for_route(
  #     Ptv::TRAM_TYPE,
  #     Ptv::BELMONT_AVE_STOP,
  #     Ptv::ROUTE_6_LINE,
  #     {
  #       direction_id: Ptv::MORELAND_DIRECTION,
  #       max_results: 3,
  #       include_cancelled: false,
  #       # expand: 'Disruption',
  #     }
  #   ).fetch('departures')

  #   directions = client.directions_for_route_type(Ptv::MORELAND_DIRECTION, Ptv::TRAM_TYPE)

  #   departures.map do |departure|
  #     direction = directions.find { _1['route_id'] == departure['route_id'] }
  #     Departure.from_hash({**departure, 'direction' => direction})
  #   end
  # end
end
