class Ptv
  ROUTE_TYPES = [
    {"route_type_name"=>"Train", "route_type"=>0},
    {"route_type_name"=>"Tram", "route_type"=>1},
    {"route_type_name"=>"Bus", "route_type"=>2},
    {"route_type_name"=>"Vline", "route_type"=>3},
    {"route_type_name"=>"Night Bus", "route_type"=>4}
  ]

  ROUTE_TYPES_BY_NAME = ROUTE_TYPES.index_by { _1['route_type_name'] }
  ROUTE_TYPES_BY_ID = ROUTE_TYPES.index_by { _1['route_type'] }

  def self.route_type_name(route_type)
    ROUTE_TYPES_BY_ID[route_type.to_i].fetch('route_type_name')
  end

  def self.route_type(route_type_name)
    ROUTE_TYPES_BY_NAME[route_type_name].fetch('route_type')
  end
end
