# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_context :category_context do
  def create_category(options={})
    Categories::CreateCategory.run!(
      title: options[:title] || "Category",
      color: options[:color] || "#000000"
    )
  end
end
