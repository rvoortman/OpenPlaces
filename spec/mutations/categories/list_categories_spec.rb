# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Categories::ListCategories do
  include_context :category_context

  let(:category) { create_category }

  it 'returns an empty array when there are no categories' do
    expect(described_class.run!).to eq([])
  end

  it 'returns all the categories' do
    category = create_category
    expect(described_class.run!).to eq([category])
  end
end
