# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Maps::AddUserToMap do
  include_context :map_context
  include_context :user_context

  let(:user) { create_user }
  let(:map_without_user) { create_map_without_user }
  let(:valid_params) { { map: map_without_user, user: user} }

  it 'adds a user to the map' do
    expect do
      described_class.run!(valid_params)
    end.to change(MapUser, :count).by(1)
  end

  it 'throws a validation error if user is missing' do
    expect do
      described_class.run!(valid_params.except!(:user))
    end.to raise_error(Mutations::ValidationException, /User is required/)
  end

  it 'throws a validation error if the user is already part of the map' do
    map = create_map
    expect do
      described_class.run!(map: map, user: map.users.first)
    end.to raise_error(Mutations::ValidationException, /User is already part of the map/)
  end

  it 'throws a validation error if map is missing' do
    expect do
      described_class.run!(valid_params.except!(:map))
    end.to raise_error(Mutations::ValidationException, /Map is required/)
  end
end
