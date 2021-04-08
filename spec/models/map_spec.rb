# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Map, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to have_many(:users) }
  it { is_expected.to have_many(:point_of_interests) }
end
