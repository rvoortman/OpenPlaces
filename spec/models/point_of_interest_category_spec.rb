# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PointOfInterestCategory, type: :model do
  it { is_expected.to belong_to(:category) }
  it { is_expected.to belong_to(:point_of_interest) }
end
