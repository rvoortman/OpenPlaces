# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Categories::CreateCategory do
  include_context :user_context

  let(:user) { create_user }
  let(:valid_params) { { title: "test", color: "#000000", user: user} }

  it 'creates a category' do
    expect do
      described_class.run!(valid_params)
    end.to change(Category, :count).by(1)
  end

  it 'throws a validation error if user is missing' do
    expect do
      described_class.run!(valid_params.except!(:user))
    end.to raise_error(Mutations::ValidationException, /User is required/)
  end

  it 'throws a validation error if title is missing' do
    expect do
      described_class.run!(valid_params.except!(:title))
    end.to raise_error(Mutations::ValidationException, /Title is required/)
  end

  it 'throws a validation error if latitude is missing' do
    expect do
      described_class.run!(valid_params.except!(:color))
    end.to raise_error(Mutations::ValidationException, /Color is required/)
  end
end
