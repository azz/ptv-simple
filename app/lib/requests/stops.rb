class Requests::Stops < Requests::Base
  def self.stop(...) = new.stop(...)

  def stop(stop_id:, route_type:)
    stop = client.stop(stop_id, route_type)

    Stop.from_hash(stop)
  end
end
