class Requests::Departures < Requests::Base
  def self.departures(...) = new.departures(...)

  def departures(stop:, direction:)
    response = client.departures(
      stop.route_type,
      stop.stop_id,
      {
        direction_id: direction.direction_id,
        max_results: 3,
        include_cancelled: false,
        expand: 'Disruption',
      }
    )
    departures = response.fetch('departures')
    disruptions_hash = response.fetch('disruptions')

    departures.map do |departure|
      disruptions = departure['disruption_ids'].map { disruptions_hash[_1.to_s] }

      Departure.from_hash({
        **departure,
        'disruptions' => disruptions,
      })
    end
  end
end
