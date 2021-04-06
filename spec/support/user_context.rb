# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_context :user_context do
  def create_user(options={})
    Users::CreateUser.run!(
      email: options[:email] || "test@example.org",
      password: options[:password] || "testtest",
      password_confirmation: options[:password_confirmation] || "testtest"
    )
  end
end
