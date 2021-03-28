# frozen_string_literal: true

module Categories
  class CreateCategory < Mutations::Command
    required do
      string :title
      string :color
    end

    def execute
      Category.create!({
                         title: title,
                         color: color
                       })
    end
  end
end
