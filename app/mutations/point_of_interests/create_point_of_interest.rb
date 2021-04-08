# frozen_string_literal: true

module PointOfInterests
  class CreatePointOfInterest < Mutations::Command
    required do
      string :title
      float :longitude
      float :latitude
    end

    optional do
      array :categories, class: Category, empty: true
    end

    def validate

    end

    def execute
      PointOfInterest.create!({
                                title: title,
                                longitude: longitude,
                                latitude: latitude,
                                categories: categories || []
                              })
    end
  end
end
