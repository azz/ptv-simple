class Requests::Search < Requests::Base
  def self.execute(...) = new.execute(...)

  def execute(search_term, route_types:)
    result = client.search(search_term, {
      route_types: route_types.join(','),
      include_outlets: false,
    })

    SearchResult.from_hash(result)
  end
end
