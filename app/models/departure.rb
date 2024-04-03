class Departure < T::Struct
  const :platform_number, T.nilable(String)
  const :scheduled_departure_utc, String
  const :estimated_departure_utc, T.nilable(String)
  const :disruptions, T::Array[Disruption]

  def estimated_departure_at = Time.zone.parse(estimated_departure_utc)
  def scheduled_departure_at = Time.zone.parse(scheduled_departure_utc)

  def live? = !!estimated_departure_utc
end
