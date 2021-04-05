# frozen_string_literal: true

module PublicApi
  module Routes
    class PointOfInterests < Grape::API
      resources :point_of_interests do
        desc 'List all categories'
        get do
          present ::PointOfInterests::ListPointOfInterests.run!, with: PublicApi::Entities::PointOfInterest
        end

        desc 'Get a single point of interest'
        route_param :id do
          get do
            present ::PointOfInterests::FindPointOfInterest.run!(id: params[:id]), with: PublicApi::Entities::PointOfInterest
          end
        end

        desc 'Destroys the point of interest'
        route_param :id do
          delete do
            present ::PointOfInterests::DestroyPointOfInterest.run!(id: params[:id]), with: PublicApi::Entities::PointOfInterest
          end
        end

        desc 'Create a new point of interest'
        params do
          requires :title, type: String
          requires :latitude, type: Float
          requires :longitude, type: Float
        end
        post do
          present ::PointOfInterests::CreatePointOfInterest.run!(title: params[:title], latitude: params[:latitude], longitude: params[:longitude]), with: PublicApi::Entities::PointOfInterest
        end
      end
    end
  end
end
