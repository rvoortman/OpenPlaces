# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::CreateUser do
  let(:valid_params) do
    { email: "test@example.org", password: "testtest", password_confirmation: "testtest" }
  end

  it 'creates a user' do
    expect do
      described_class.run!(valid_params)
    end.to change(User, :count).by(1)
  end

  it 'throws a validation error if email is missing' do
    expect do
      described_class.run!(valid_params.except!(:email))
    end.to raise_error(Mutations::ValidationException, /Email is required/)
  end

  it 'throws a validation error if password is missing' do
    expect do
      described_class.run!(valid_params.except!(:password))
    end.to raise_error(Mutations::ValidationException, /Password is required/)
  end

  it 'throws a validation error if password confirmation is missing' do
    expect do
      described_class.run!(valid_params.except!(:password_confirmation))
    end.to raise_error(Mutations::ValidationException, /Password Confirmation is required/)
  end
end
