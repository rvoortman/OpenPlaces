# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Maps::ListMaps do
  include_context :map_context

  let(:map) { create_map }

  it 'returns all the maps that belongs to an user' do
    expect(described_class.run!(user: map.users.first)).to eq([map])
  end

  it 'does not return maps from other users' do
    map2 = create_map

    expect(described_class.run!(user: map.users.first)).not_to include([map2])
  end
end
