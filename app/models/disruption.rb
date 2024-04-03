class Disruption < T::Struct
  # "disruption_id": 0,
  const :disruption_id, Integer
  # "title": "string",
  const :title, String
  # "url": "string",
  const :url, String
  # "description": "string",
  const :description, String
  # "disruption_status": "string",
  # "disruption_type": "string",
  const :disruption_type, String
  # "published_on": "2024-04-03T12:38:02.189Z",
  # "last_updated": "2024-04-03T12:38:02.189Z",
  # "from_date": "2024-04-03T12:38:02.189Z",
  # "to_date": "2024-04-03T12:38:02.189Z",
  # "colour": "string",
  const :colour, String
  # "display_on_board": true,
  # "display_status": true
  const :display_status, T::Boolean
end