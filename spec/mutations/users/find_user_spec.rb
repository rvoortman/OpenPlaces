# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::FindUser do
  include_context :user_context

  let(:user) { create_user }

  it 'returns the point of interest' do
    expect(described_class.run!(id: user.id)).to eq(user)
  end

  it 'throws a validation error if id is not an uuid' do
    expect do
      described_class.run!(id: 1234)
    end.to raise_error(Mutations::ValidationException, /ID is invalid/)
  end

  it 'throws a validation error if id is not found' do
    expect do
      described_class.run!(id: SecureRandom.uuid.to_s)
    end.to raise_error(Mutations::ValidationException, /Couldn't find user/)
  end
end
