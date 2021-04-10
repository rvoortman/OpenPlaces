# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Maps::CreateMap do
  include_context :user_context

  let(:user) { create_user }
  let(:valid_params) { { title: "test", user: user} }

  it 'creates a map' do
    expect do
      described_class.run!(valid_params)
    end.to change(Map, :count).by(1)
  end

  it 'adds the user to a map' do
    expect do
      described_class.run!(valid_params)
    end.to change(MapUser, :count).by(1)
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
end
