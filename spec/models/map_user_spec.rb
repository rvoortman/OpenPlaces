# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MapUser, type: :model do
  include_context :map_context
  let(:map) { create_map }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:map) }

  it "must be unique" do
    map_user = described_class.create(map: map, user: map.users.first)
    expect(map_user.errors_on(:user).size).to eq(1)
  end
end
