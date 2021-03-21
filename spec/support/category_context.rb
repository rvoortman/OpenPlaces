# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_context :category_context do
  def create_category(options={})
    Category.create!(
      title: options[:title] || "Point of Interest",
      longitude: options[:color] || "#000000"
    )
  end
end
