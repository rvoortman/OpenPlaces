# frozen_string_literal: true

module PublicApi
  module Entities
    class Category < Grape::Entity
      expose :id
      expose :title
      expose :color
      expose :created_at
      expose :updated_at
    end
  end
end
