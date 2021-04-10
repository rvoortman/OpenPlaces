# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Maps::DestroyMap do
  include_context :map_context

  let(:map) { create_map }

  it 'returns the destroyed map' do
    expect(described_class.run!(id: map.id)).to eq(map)
  end

  it 'destroys map' do
    map
    expect do
      described_class.run!(id: map.id)
    end.to change(Map, :count).from(1).to(0)
  end

  it 'throws a validation error if id is not an uuid' do
    expect do
      described_class.run!(id: 1234)
    end.to raise_error(Mutations::ValidationException, /ID is invalid/)
  end

  it 'throws a validation error if the id could not be found' do
    expect do
      described_class.run!(id: SecureRandom.uuid.to_s)
    end.to raise_error(Mutations::ValidationException, /Couldn't find map/)
  end
end
