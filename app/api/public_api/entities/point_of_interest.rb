# frozen_string_literal: true

module PublicApi
  module Entities
    class PointOfInterest < Grape::Entity
      expose :id
      expose :title
      expose :latitude
      expose :longitude
      expose :created_at
      expose :updated_at
    end
  end
end
