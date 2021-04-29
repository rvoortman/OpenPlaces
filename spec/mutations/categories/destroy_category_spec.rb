# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Categories::DestroyCategory do
  include_context :category_context

  let(:category) { create_category }
  let(:valid_params) { { id: category.id, user: user } }

  it 'returns the destroyed category' do
    expect(described_class.run!(valid_params)).to eq(category)
  end

  it 'destroys category' do
    category
    expect do
      described_class.run!(valid_params)
    end.to change(Category, :count).from(1).to(0)
  end

  it 'throws a validation error if id is not an uuid' do
    expect do
      described_class.run!(id: 1234, user: user)
    end.to raise_error(Mutations::ValidationException, /ID is invalid/)
  end

  it 'throws a validation error if user is missing' do
    expect do
      described_class.run!(valid_params.except!(:user))
    end.to raise_error(Mutations::ValidationException, /User is required/)
  end

  it 'throws a validation error if the id could not be found' do
    expect do
      described_class.run!(id: SecureRandom.uuid.to_s, user: user)
    end.to raise_error(Mutations::ValidationException, /Couldn't find category/)
  end
end
