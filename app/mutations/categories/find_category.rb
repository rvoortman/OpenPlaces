# frozen_string_literal: true

module Categories
  class FindCategory < Mutations::Command
    required do
      uuid :id
      model :user
    end

    def validate
      return add_error(:id, :not_found, "Couldn't find category") unless category
      add_error(:user, :unauthorized, "This category does not belong to this user") if user.id != category.user.id
    end

    def execute
      category
    end

    private

    def category
      @category ||= Category.find(id)
    rescue ActiveRecord::RecordNotFound
      nil
    end
  end
end
