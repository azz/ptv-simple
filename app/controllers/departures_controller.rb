class DeparturesController < ApplicationController
  include ActionView::Helpers::DateHelper

  # GET /departures
  def index
    train_departures = Requests::Departures.gardiner_departures.map do |departure|
      {
        departs_at: departure.departure_at.to_fs(:short),
        departs_in: time_ago_in_words(departure.departure_at),
        # data: departure
      }
    end

    tram_departures = Requests::Departures.belmont_departures.map do |departure|
      {
        departs_at: departure.departure_at.to_fs(:short),
        departs_in: time_ago_in_words(departure.departure_at),
        # data: departure
      }
    end

    render json: {train_departures:, tram_departures:}
  end
end
