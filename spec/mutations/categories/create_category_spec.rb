# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Categories::CreateCategory do
  let(:valid_params) { { title: "test", color: "#000000" } }

  it 'creates a category' do
    expect do
      described_class.run!(valid_params)
    end.to change(Category, :count).by(1)
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
