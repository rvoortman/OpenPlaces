# frozen_string_literal: true

module PublicApi
  module Routes
    class Categories < Grape::API
      resources :categories do
        desc 'List all categories'
        get do
          present ::Categories::ListCategories.run!, with: PublicApi::Entities::Category
        end

        desc 'Get a single category'
        route_param :id do
          get do
            present ::Categories::FindCategory.run!(id: params[:id]), with: PublicApi::Entities::Category
          end
        end

        desc 'Destroys the category'
        route_param :id do
          delete do
            present ::Categories::DestroyCategory.run!(id: params[:id]), with: PublicApi::Entities::Category
          end
        end

        desc 'Create a new category'
        params do
          requires :title, type: String
          requires :color, type: String
        end
        post do
          present ::Categories::CreateCategory.run!(title: params[:title], color: params[:color]), with: PublicApi::Entities::Category
        end
      end


      #   desc 'Create a new category'
      #   params do
      #     requires :title, type: String
      #     requires :color, type: String
      #   end
      #   post do
      #     Categories::CreateCategory.run!(id: id)
      #   end
      end
    end
  # end
end
