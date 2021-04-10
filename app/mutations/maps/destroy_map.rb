# frozen_string_literal: true

module Maps
  class DestroyMap < Mutations::Command
    required do
      uuid :id
    end

    def validate
      add_error(:id, :not_found, "Couldn't find map") unless map
    end

    def execute
      map.destroy
      map
    end

    private

    def map
      @map ||= Maps::FindMap.run!(id: id)
    end
  end
end
