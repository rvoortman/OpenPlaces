# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Categories::FindCategory do
  include_context :category_context

  let(:category) { create_category }

  it 'returns the category' do
    expect(described_class.run!(id: category.id, user: user)).to eq(category)
  end

  it 'throws a validation error if id is not an uuid' do
    expect do
      described_class.run!(id: 1234, user: user)
    end.to raise_error(Mutations::ValidationException, /ID is invalid/)
  end

  it 'throws a validation error if id is not found' do
    expect do
      described_class.run!(id: SecureRandom.uuid.to_s, user: user)
    end.to raise_error(Mutations::ValidationException, /Couldn't find category/)
  end

  it 'throws a validation error user does not belong to category' do
    expect do
      described_class.run!(id: category.id, user: create_user(email: "bla@example.com"))
    end.to raise_error(Mutations::ValidationException, /This category does not belong to this user/)
  end
end
