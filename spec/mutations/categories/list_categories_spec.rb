# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Categories::ListCategories do
  include_context :category_context

  let(:category) { create_category }

  it 'returns all the categories that belongs to an user' do
    expect(described_class.run!(user: category.user)).to eq([category])
  end

  it 'does not return categoriees from other users' do
    category2 = create_category

    expect(described_class.run!(user: category.user)).not_to include([category2])
  end
end
