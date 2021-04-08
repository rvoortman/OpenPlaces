# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:point_of_interests) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:color) }
end
