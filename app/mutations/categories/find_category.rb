# frozen_string_literal: true

module Categories
  class FindCategory < Mutations::Command
    required do
      uuid :id
    end

    def validate
      add_error(:id, :not_found, "Couldn't find category") unless category
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
