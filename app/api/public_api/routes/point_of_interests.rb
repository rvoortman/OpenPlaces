# frozen_string_literal: true

module PublicApi
  module Routes
    class PointOfInterests < Grape::API
      # resources :point_of_interests do
      #   desc 'List all point of interests'
      #   get do
      #     PointOfInterests::ListPointOfInterests.run!
      #   end

      #   desc 'Get a single point of interest'
      #   route_param :id
      #     get do
      #       PointOfInterests::FindPointOfInterest.run!(id: id)
      #     end
      #   end

      #   desc 'Destroys the point of interest'
      #   route_param :id
      #     get do
      #       PointOfInterests::DestroyPointOfInterest.run!(id: id)
      #     end
      #   end

      #   desc 'Create a new point of interest'
      #   params do
      #     requires :title, type: String
      #     requires :latitude, type: BigDecimal
      #     requires :longitude, type: BigDecimal
      #   end
      #   post do
      #     PointOfInterests::CreatePointOfInterest.run!(id: id)
      #   end
      # end
    end
  end
end
