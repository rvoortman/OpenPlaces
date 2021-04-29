# frozen_string_literal: true

module Categories
  class UpdateCategory < Mutations::Command
    required do
      uuid :id
      model :user
      hash :category do
        optional do
          string :title, empty: true
          string :color, empty: true
        end
      end
    end

    def execute
      category_instance.update(
        category
      )

      category_instance.save
      category_instance
    end

    private

    def category_instance
      @category_instance ||= Categories::FindCategory.run!(id: id, user: user)
    end
  end
end
