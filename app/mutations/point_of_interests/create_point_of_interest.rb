# frozen_string_literal: true

module PointOfInterests
  class CreatePointOfInterest < Mutations::Command
    required do
      string :title
      float :longitude
      float :latitude
      model :map
    end

    optional do
      array :categories, class: Category, empty: true
    end

    def execute
      PointOfInterest.create!({
                                title: title,
                                longitude: longitude,
                                latitude: latitude,
                                categories: categories || [],
                                map: map
                              })
    end
  end
end
