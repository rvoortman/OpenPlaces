# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  include_context :user_context
  let(:user) { create_user }

  it { is_expected.to have_many(:access_grants) }
  it { is_expected.to have_many(:access_tokens) }
  it { is_expected.to have_many(:categories) }
  it { is_expected.to have_many(:maps) }
  
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_confirmation_of(:password) }

  it "is a valid user" do
    expect(user.errors.size).to eq(0)
  end

  describe "#email" do
    it "checks if there is a at-symbol in the email" do
      user.email = "testwithoutat.com"

      expect(user.errors_on(:email).size).to eq(1)
    end
  end

  describe "#password" do
    it "checks if the password is long enough" do
      user.password = "12345678"

      expect(user.errors_on(:password).size).to eq(0)
    end

    it "checks if the password length is less then 8" do
      user.password = "1234567"

      expect(user.errors_on(:password).size).to eq(1)
    end

    it "checks if the password length not greater than 128" do
      user.password = rand(36**129).to_s(36)

      expect(user.errors_on(:password).size).to eq(1)
    end

    it "checks if the second password is the same as the first one" do
      user.password = "testtest"
      user.password_confirmation = "testtest"

      expect(user.errors_on(:password).size).to eq(0)
      expect(user.errors_on(:password_confirmation).size).to eq(0)
    end

    it "throws a error if the password confirmation is not the same as the password" do
      user.password = "testtest"
      user.password_confirmation = "blablabla"

      expect(user.errors_on(:password).size).to eq(0)
      expect(user.errors_on(:password_confirmation).size).to eq(1)
    end
  end
end
