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

  it 'does not save if user is missing' do
    category = described_class.run!(valid_params.except!(:user))

    expect(category).not_to be_persisted
  end

  it 'does not save if title is missing' do
    category = described_class.run!(valid_params.except!(:title))

    expect(category).not_to be_persisted
  end

  it 'does not save if color is missing' do
    category = described_class.run!(valid_params.except!(:color))

    expect(category).not_to be_persisted
  end
end
