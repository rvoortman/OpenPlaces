# frozen_string_literal: true

module Maps
  class AddUserToMap < Mutations::Command
    required do
      model :map
      model :user
    end

    def validate
      add_error(:user, :already_exists, "User is already part of the map") if map_user_already_exist?
    end

    def execute
      MapUser.create!(map: map, user: user)
    end

    private

    def map_user_already_exist?
      MapUser.exists?(map: map, user: user)
    end
  end
end
