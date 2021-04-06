# frozen_string_literal: true

module PointOfInterests
  class ListPointOfInterests < Mutations::Command
    def execute
      PointOfInterest.all
    end
  end
end
