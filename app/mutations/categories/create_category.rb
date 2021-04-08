# frozen_string_literal: true

module Categories
  class CreateCategory < Mutations::Command
    required do
      string :title
      string :color
      model :user
    end

    def execute
      Category.create!({
                         user: user,
                         title: title,
                         color: color
                       })
    end
  end
end
