# frozen_string_literal: true

module Categories
  class DestroyCategory < Mutations::Command
    required do
      uuid :id
    end

    def validate
      add_error(:id, :not_found, "Couldn't find category") unless category
    end

    def execute
      category.destroy
      category
    end

    private

    def category
      @category ||= Categories::FindCategory.run!(id: id)
    end
  end
end
