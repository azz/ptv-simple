class AlexaController < ApplicationController
  include ActionView::Helpers::DateHelper

  skip_before_action :verify_authenticity_token

  # POST /alexa

  # {
  #   "type": "IntentRequest",
  #   "requestId": "string",
  #   "timestamp": "string",
  #   "dialogState": "string",
  #   "locale": "string",
  #   "intent": {
  #     "name": "string",
  #     "confirmationStatus": "string",
  #     "slots": {
  #       "SlotName": {
  #         "name": "string",
  #         "value": "string",
  #         "confirmationStatus": "string",
  #         "slotValue": {},
  #         "resolutions": {
  #           "resolutionsPerAuthority": [
  #             {
  #               "authority": "string",
  #               "status": {
  #                 "code": "string"
  #               },
  #               "values": [
  #                 {
  #                   "value": {
  #                     "name": "string",
  #                     "id": "string"
  #                   }
  #                 }
  #               ]
  #             }
  #           ]
  #         }
  #       }
  #     }
  #   }
  # }
  def new
    route_type_name = 'Train'
    stop_name = 'Gardiner'
    direction_name = 'City'

    route_type = Ptv.route_type(route_type_name)
    stop_search = Requests::Search.execute(stop_name, route_types: [route_type])
    result = stop_search.stops.filter_map do |stop|
      directions = stop.routes.flat_map do |route|
        Requests::Directions.from_route(route_id: route.route_id)
      end
      direction = directions.find { _1.direction_name == direction_name }
      next unless direction

      departures = Requests::Departures.departures(stop:, direction:)
      OpenStruct.new(stop:, direction:, departures:,)
    end.first

    if result
      details = result.departures.take(2).map do |departure|
        date = departure.estimated_departure_at || departure.scheduled_departure_at
        "in #{distance_of_time_in_words_to_now(date)}"
      end.join(" and ")

      text_response = format(
        "The next %s departures from %s to %s are %s.",
        Ptv.route_type_name(result.stop.route_type),
        result.stop.stop_name,
        result.direction.direction_name.sub(' (Flinders Street)', ''),
        details
      )
    else
      text_response = "Unable to check departures at this time."
    end

    render json: {
      "version": "1.0",
      "response": {
        "outputSpeech": {
          "type": "PlainText",
          "text": text_response,
          "playBehavior": "REPLACE_ENQUEUED"
        },
        "shouldEndSession": true
      }
    }
  end
end
