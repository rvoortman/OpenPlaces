# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PointOfInterest, type: :model do
  include_context :point_of_interest_context
  let(:point_of_interest) { create_point_of_interest }

  it { is_expected.to belong_to(:map) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:latitude) }
  it { is_expected.to validate_presence_of(:longitude) }
  it { is_expected.to validate_numericality_of(:latitude) }
  it { is_expected.to validate_numericality_of(:longitude) }
  it { is_expected.to have_many(:categories) }

  describe "#longitude" do
    it "can't be smaller than -180" do
      point_of_interest.longitude = -181
      expect(point_of_interest.errors_on(:longitude).size).to eq(1)
    end

    it "can't be larger than 180" do
      point_of_interest.longitude = 181
      expect(point_of_interest.errors_on(:longitude).size).to eq(1)
    end
  end

  describe "#latitude" do
    it "can't be smaller than 0" do
      point_of_interest.latitude = -1
      expect(point_of_interest.errors_on(:latitude).size).to eq(1)
    end

    it "can't be larger than 90" do
      point_of_interest.latitude = 91
      expect(point_of_interest.errors_on(:latitude).size).to eq(1)
    end
  end
end
