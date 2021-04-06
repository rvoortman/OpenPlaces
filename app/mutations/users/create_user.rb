# frozen_string_literal: true

module Users
  class CreateUser < Mutations::Command
    required do
      string :email
      string :password, min_length: 8, max_length: 128
      string :password_confirmation, min_length: 8, max_length: 128
    end

    def execute
      User.create!({
                     email: email,
                     password: password,
                     password_confirmation: password_confirmation
                   })
    end
  end
end
