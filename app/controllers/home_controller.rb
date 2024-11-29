class HomeController < ApplicationController
  # GET /
  def index
    unless params[:q]
      return redirect_to "?q=Train|Gardiner|City,Tram|Belmont Ave|Moreland"
    end

    options = params.fetch(:q)
      .split(',')
      .map do |o|
        route_type_name, stop_name, direction_name = o.split('|')
        {route_type_name:, stop_name:, direction_name:}
      end

    @options = options.map do |option|
      route_type = Ptv.route_type(option[:route_type_name])
      stop_search = Requests::Search.execute(
        option[:stop_name],
        route_types: [route_type]
      )
      stop_search.stops.filter_map do |stop|
        directions = stop.routes.flat_map do |route|
          Requests::Directions.from_route(route_id: route.route_id)
        end
        direction = directions.find { _1.direction_name == option[:direction_name] }
        next unless direction

        departures = Requests::Departures.departures(stop:, direction:)

        OpenStruct.new(stop:, direction:, departures:,)
      end.first.tap do |result|
        if result.nil?
          raise ActionController::RoutingError.new(
            "Could not found #{option[:route_type_name]} stop '#{option[:stop_name]}' going to '#{option[:direction_name]}'"
          )
        end
      end
    end
  end
end
