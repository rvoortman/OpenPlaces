# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PointOfInterests::CreatePointOfInterest do
  let(:valid_params) { { title: "test", latitude: 0.0, longitude: 0.0 } }

  it 'creates a point of interest' do
    expect do
      described_class.run!(valid_params)
    end.to change(PointOfInterest, :count).by(1)
  end

  it 'throws a validation error if title is missing' do
    expect do
      described_class.run!(valid_params.except!(:title))
    end.to raise_error(Mutations::ValidationException, /Title is required/)
  end

  it 'throws a validation error if latitude is missing' do
    expect do
      described_class.run!(valid_params.except!(:latitude))
    end.to raise_error(Mutations::ValidationException, /Latitude is required/)
  end

  it 'throws a validation error if longitude is missing' do
    expect do
      described_class.run!(valid_params.except!(:longitude))
    end.to raise_error(Mutations::ValidationException, /Longitude is required/)
  end

  context "with categories" do
    include_context :category_context

    let(:category1) { create_category(title: "test1") }
    let(:category2) { create_category(title: "test2") }

    it 'allows the possibility to add categories' do
      valid_params[:categories] = [category1, category2]

      poi = described_class.run!(valid_params)

      expect(poi.categories).to include(category1, category2)
    end

    it 'throws an error if the categories are not the right class' do
      valid_params[:categories] = ["category1"]

      expect do
        described_class.run!(valid_params)
      end.to raise_error(Mutations::ValidationException, /isn't the right class/)
    end
  end
end
