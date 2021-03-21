
# frozen_string_literal: true

module PointOfInterests
  class CreatePointOfInterest < Mutations::Command
    required do
      string :title
      float :longitude
      float :latitude
    end

    def execute
      PointOfInterest.create!({
        title: title,
        longitude: longitude,
        latitude: latitude
      })
    end
  end
end