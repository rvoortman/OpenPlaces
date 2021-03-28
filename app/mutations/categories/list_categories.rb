# frozen_string_literal: true

module Categories
  class ListCategories < Mutations::Command
    def execute
      Category.all
    end
  end
end
