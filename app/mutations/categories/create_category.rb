# frozen_string_literal: true

module Categories
  class CreateCategory < Mutations::Command
    optional do
      string :title, empty: true
      string :color, empty: true
      model :user
    end

    def execute
      category = Category.new(
                    user: user,
                    title: title,
                    color: color
                  )
      category.save

      category
    end
  end
end
