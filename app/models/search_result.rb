class SearchResult < T::Struct
  class SearchResultRoute < T::Struct
    const :route_id, Integer
    const :route_name, String
    const :route_type, Integer
  end

  class SearchResultStop < T::Struct
    const :stop_id, Integer
    const :stop_name, String
    const :route_type, Integer
    const :routes, T::Array[SearchResultRoute]
  end

  const :stops, T::Array[SearchResultStop]
  const :routes, T::Array[SearchResultRoute]
end
