
# frozen_string_literal: true

module PointOfInterests
  class FindPointOfInterest < Mutations::Command
    required do
      uuid :id
    end

    def validate
      add_error(:id, :not_found, "Couldn't find point of interest") unless point_of_interest
    end

    def execute
      point_of_interest
    end

    private

    def point_of_interest
      @point_of_interest ||= PointOfInterest.find(id)
    rescue ActiveRecord::RecordNotFound
      nil
    end
  end
end