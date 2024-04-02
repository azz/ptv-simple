require "rails_helper"

RSpec.describe DeparturesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/departures").to route_to("departures#index")
    end
  end
end
