# frozen_string_literal: true

module Maps
  class ListMaps < Mutations::Command
    required do
      model :user
    end

    def execute
      user.maps
    end
  end
end
