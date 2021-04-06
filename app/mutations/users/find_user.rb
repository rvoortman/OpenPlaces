# frozen_string_literal: true

module Users
  class FindUser < Mutations::Command
    required do
      uuid :id
    end

    def validate
      add_error(:id, :not_found, "Couldn't find user") unless user
    end

    def execute
      user
    end

    private

    def user
      @user ||= User.find(id)
    rescue ActiveRecord::RecordNotFound
      nil
    end
  end
end
