# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_context :map_context do
  include_context :user_context
  let(:user) { create_user }

  def create_map(options={})
    Maps::CreateMap.run!(
      title: options[:title] || "Map Title",
      user: options[:user] || user
    )
  end

  def create_map_without_user(options={})
    Map.create!(
      title: options[:title] || "Map Title"
    )
  end
end
