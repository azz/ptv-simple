class Requests::Directions < Requests::Base
  def self.from_route(...) = new.from_route(...)

  def from_route(route_id:)
    directions = client.directions_for_route(route_id)

    directions.map do |direction|
      Direction.from_hash(direction)
    end
  end
end
