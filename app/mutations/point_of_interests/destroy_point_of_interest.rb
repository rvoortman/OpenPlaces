# frozen_string_literal: true

module PointOfInterests
  class DestroyPointOfInterest < Mutations::Command
    required do
      uuid :id
    end

    def validate
      add_error(:id, :not_found, "Couldn't find point of interest") unless point_of_interest
    end

    def execute
      point_of_interest.destroy
      point_of_interest
    end

    private

    def point_of_interest
      @point_of_interest ||= PointOfInterests::FindPointOfInterest.run!(id: id)
    end
  end
end
