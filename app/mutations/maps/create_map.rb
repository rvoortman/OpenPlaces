# frozen_string_literal: true

module Maps
  class CreateMap < Mutations::Command
    required do
      string :title
      model :user
    end

    def execute
      Maps::AddUserToMap.run!(map: map, user: user)
      map
    end

    private

    def map
      @map ||= Map.create!(title: title)
    end
  end
end
