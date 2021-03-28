# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PublicApi::Routes::Categories do
  include_context :api_context
  include_context :category_context

  let!(:category) { create_category }

  context "GET /categories.json" do
    it "returns a list of category" do
      request(:get, "categories.json")

      expect(response).to have_status(200)
      expect(parsed_response.size).to eq(Category.count)
      expect(parsed_response.first).to be_a_representation_of(Category)
    end
  end

  context "GET /categories/:id.json" do
    it "returns a single category" do
      request(:get, "categories/#{category.id}.json")

      expect(response).to have_status(200)
      expect(parsed_response).to be_a_representation_of(Category)
    end
  end

  context "DELETE /categories/:id.json" do
    it "deletes a category" do
      request(:delete, "categories/#{category.id}.json")

      expect(response).to have_status(200)
      expect(parsed_response).to be_a_representation_of(Category)
    end
  end

  context "POST /categories.json" do
    it "creates a category" do
      request(:post, "categories.json", params: {title: "test", color: "#000000"})

      expect(response).to have_status(201)
      expect(parsed_response).to be_a_representation_of(Category)
    end
  end
end
