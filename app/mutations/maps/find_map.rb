# frozen_string_literal: true

module Maps
  class FindMap < Mutations::Command
    required do
      uuid :id
    end

    def validate
      add_error(:id, :not_found, "Couldn't find map") unless map
    end

    def execute
      map
    end

    private

    def map
      @map ||= Map.find(id)
    rescue ActiveRecord::RecordNotFound
      nil
    end
  end
end
