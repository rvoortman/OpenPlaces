# frozen_string_literal: true

module Categories
  class ListCategories < Mutations::Command
    required do
      model :user
    end

    def execute
      user.categories
    end
  end
end
