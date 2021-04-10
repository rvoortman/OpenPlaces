# frozen_string_literal: true

require 'rails_helper'
require 'shared_examples_for_api_routes'

RSpec.describe PublicApi::Routes::PointOfInterests do
  include_context :api_context
  include_context :map_context
  include_context :point_of_interest_context

  it_behaves_like 'an api route', 'point_of_interests'

  let!(:point_of_interest) { create_point_of_interest }
  let(:map) { create_map }

  context "GET /point_of_interests.json" do
    it "returns a list of point of interest" do
      request(:get, "point_of_interests.json")

      expect(response).to have_status(200)
      expect(parsed_response.size).to eq(PointOfInterest.count)
      expect(parsed_response.first).to be_a_representation_of(PointOfInterest)
    end
  end

  context "GET /point_of_interest/:id.json" do
    it "returns a single point of interest" do
      request(:get, "point_of_interests/#{point_of_interest.id}.json")

      expect(response).to have_status(200)
      expect(parsed_response).to be_a_representation_of(PointOfInterest)
    end

    it "returns a 404 when the point of interest could not be found" do
      request(:get, "point_of_interests/1234.json")

      expect(response).to have_status(404)
    end
  end

  context "DELETE /point_of_interests/:id.json" do
    it "deletes a point of interest" do
      request(:delete, "point_of_interests/#{point_of_interest.id}.json")

      expect(response).to have_status(200)
      expect(parsed_response).to be_a_representation_of(PointOfInterest)
    end

    it "returns a 404 when the point of interest could not be found" do
      request(:delete, "point_of_interests/1234.json")

      expect(response).to have_status(404)
    end
  end

  context "POST /point_of_interests.json" do
    it "creates a point of interest" do
      request(:post, "point_of_interests.json",
              params: {title: "test", longitude: 0.0, latitude: 0.0, map_id: map.id})

      expect(response).to have_status(201)
      expect(parsed_response).to be_a_representation_of(PointOfInterest)
    end

    it "returns a 400 when a parameter is missing" do
      request(:post, "point_of_interests.json", params: {title: "test", longitude: 0.0, map_id: map.id})

      expect(response).to have_status(400)
      expect(parsed_response["error"]).to eq("latitude is missing")
    end
  end
end
