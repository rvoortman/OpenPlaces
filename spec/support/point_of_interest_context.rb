# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_context :point_of_interest_context do
  def create_point_of_interest(options={})
    PointOfInterest.create!(
      title: options[:title] || "Point of Interest",
      longitude: options[:longitude] || 0.0,
      latitude: options[:latitude] || 0.0
    )
  end
end
