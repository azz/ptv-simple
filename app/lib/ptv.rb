class Ptv

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

  def self.route_type_name(route_type)
    ROUTE_TYPES
      .find { _1['route_type'] == route_type.to_i }
      &.fetch('route_type_name')
  end
end