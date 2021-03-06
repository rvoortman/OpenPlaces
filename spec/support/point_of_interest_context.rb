# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_context :point_of_interest_context do
  include_context :map_context
  let(:map) { create_map }

  def create_point_of_interest(options={})
    PointOfInterests::CreatePointOfInterest.run!(
      title: options[:title] || "Point of Interest",
      longitude: options[:longitude] || 0.0,
      latitude: options[:latitude] || 0.0,
      map: options[:map] || map
    )
  end
end
