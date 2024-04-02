class Stop < T::Struct
  # "point_id"=>19912,
  # "operating_hours"=>"N",
  # "mode_id"=>2,
  # "station_details_id"=>0,
  # "flexible_stop_opening_hours"=>"",
  # "stop_contact"=>nil,
  # "stop_ticket"=>nil,
  # "disruption_ids"=>[],
  # "station_type"=>"Unstaffed Station",
  # "station_description"=>"This station is unstaffed. Protective Services Officers may be present from 6pm to last train Sunday to Thursday and until around 1am on Fridays and Saturdays.",
  # "route_type"=>0,
  const :route_type, Integer
  # "stop_location"=>nil,
  # "stop_amenities"=>nil,
  # "stop_accessibility"=>nil,
  # "stop_staffing"=>nil,
  # "routes"=>
  #   [{"route_type"=>0,
  #     "route_id"=>7,
  #     "route_name"=>"Glen Waverley",
  #     "route_number"=>"",
  #     "route_gtfs_id"=>"2-GLW",
  #     "geopath"=>[]}],
  # "stop_id"=>1075,
  const :stop_id, Integer
  const :stop_name, String
  def stop_name = @stop_name.strip
  # "stop_name"=>"Gardiner ",
  # "stop_landmark"=>""
end
