# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PointOfInterests::ListPointOfInterests do
  include_context :point_of_interest_context

  it 'returns an empty array when there are no point of interests' do
    expect(described_class.run!).to eq([])
  end

  it 'returns all the point of interests' do
    point_of_interest = create_point_of_interest
    expect(described_class.run!).to eq([point_of_interest])
  end
end
