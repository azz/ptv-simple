class Requests::Departures < Requests::Base
  def self.gardiner_departures = new.gardiner_departures
  def self.belmont_departures = new.belmont_departures

  TRAIN_TYPE = 0
  TRAM_TYPE = 1

  GARDINER_STOP = 1075
  BELMONT_AVE_STOP = 2618

  GLEN_WAVERLEY_LINE = 7
  ROUTE_6_LINE = 11544

  ROUTE_TYPES = [
    {"route_type_name"=>"Train", "route_type"=>0},
    {"route_type_name"=>"Tram", "route_type"=>1},
    {"route_type_name"=>"Bus", "route_type"=>2},
    {"route_type_name"=>"Vline", "route_type"=>3},
    {"route_type_name"=>"Night Bus", "route_type"=>4}
  ]

  CITYBOUND_DIRECTION = 1
  GLEN_IRIS_DIRECTION = 23
  MORELAND_DIRECTION = 24

  def gardiner_departures
    departures = client.departures_for_route(
      TRAIN_TYPE,
      GARDINER_STOP,
      GLEN_WAVERLEY_LINE,
      {
        direction_id: CITYBOUND_DIRECTION,
        max_results: 2,
        include_cancelled: false,
        expand: 'Disruption',
      }
    ).fetch('departures')

    departures.map { Departure.from_hash(_1) }
  end

  def belmont_departures
    departures = client.departures_for_route(
      TRAM_TYPE,
      BELMONT_AVE_STOP,
      ROUTE_6_LINE,
      {
        direction_id: MORELAND_DIRECTION,
        max_results: 3,
        include_cancelled: false,
        expand: 'Disruption',
      }
    ).fetch('departures')

    departures.map { Departure.from_hash(_1) }
  end
end
