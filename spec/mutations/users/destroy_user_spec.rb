# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::DestroyUser do
  include_context :user_context

  let(:user) { create_user }

  it 'returns the destroyed user' do
    expect(described_class.run!(id: user.id)).to eq(user)
  end

  it 'destroys user' do
    user
    expect do
      described_class.run!(id: user.id)
    end.to change(User, :count).from(1).to(0)
  end

  it 'throws a validation error if id is not an uuid' do
    expect do
      described_class.run!(id: 1234)
    end.to raise_error(Mutations::ValidationException, /ID is invalid/)
  end

  it 'throws a validation error if the id could not be found' do
    expect do
      described_class.run!(id: SecureRandom.uuid.to_s)
    end.to raise_error(Mutations::ValidationException, /Couldn't find user/)
  end
end
