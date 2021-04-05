# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PointOfInterests::FindPointOfInterest do
  include_context :point_of_interest_context

  let(:point_of_interest) { create_point_of_interest }

  it 'returns the point of interest' do
    expect(described_class.run!(id: point_of_interest.id)).to eq(point_of_interest)
  end

  it 'throws a validation error if id is not an uuid' do
    expect do
      described_class.run!(id: 1234)
    end.to raise_error(Mutations::ValidationException, /ID is invalid/)
  end

  it 'throws a validation error if id is not found' do
    expect do
      described_class.run!(id: SecureRandom.uuid.to_s)
    end.to raise_error(Mutations::ValidationException, /Couldn't find point of interest/)
  end
end
