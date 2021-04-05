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
end
