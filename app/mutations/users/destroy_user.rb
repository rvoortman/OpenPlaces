# frozen_string_literal: true

module Users
  class DestroyUser < Mutations::Command
    required do
      uuid :id
    end

    def validate
      add_error(:id, :not_found, "Couldn't find user") unless user
    end

    def execute
      user.destroy
      user
    end

    private

    def user
      @user ||= Users::FindUser.run!(id: id)
    end
  end
end
