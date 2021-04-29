# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Categories::UpdateCategory do
  include_context :user_context
  include_context :category_context

  let(:user) { create_user }
  let(:category) { create_category(title: "test1", color: "#000000") }
  let(:valid_params)  do
    {
    id: category.id,
    user: user,
    category: { title: "test2", color: "#111111" }
    }
  end

  it 'updates the category' do
    category =  described_class.run!(valid_params)

    expect(category.title).to eq("test2")
    expect(category.color).to eq("#111111")
  end

  it 'requires an user' do
    expect do
      described_class.run!(valid_params.except!(:user))
    end.to raise_error(Mutations::ValidationException, /User is required/)
  end

  it 'requires a category object' do
    expect do
      described_class.run!(valid_params.except!(:category))
    end.to raise_error(Mutations::ValidationException, /Category is required/)
  end

  it 'only changes changed attributes' do
    valid_params[:category][:title] = nil
    category = described_class.run!(valid_params)

    expect(category.title).to eq("test1")
    expect(category.color).to eq("#111111")
  end
end
