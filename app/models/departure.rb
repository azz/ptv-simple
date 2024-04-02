class Departure < T::Struct
  const :platform_number, T.nilable(String)
  const :scheduled_departure_utc, String
  const :estimated_departure_utc, T.nilable(String)
  const :direction, RouteDirection

  def departure_at
    Time.zone.parse(estimated_departure_utc || scheduled_departure_utc)
  end
end
