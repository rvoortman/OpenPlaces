require 'rails_helper'
require 'securerandom'

RSpec.describe Mutations::UUIDFilter do
  let(:filter) { described_class.new }
   it 'parses uuids as as string' do
    uuid = SecureRandom.uuid.to_s
    filtered, errors = filter.filter(uuid)

    expect(uuid).to eq(filtered)
    expect(errors).to be_nil
  end

  it 'does not treat nils as uuids' do
    filtered, errors = filter.filter(nil)

    expect(filtered).to be_nil
    expect(errors).to eq(:nils)
  end

  it 'can accept nils' do
    uuid = SecureRandom.uuid
    filtered, errors = filter.filter(uuid)
    expect(uuid).to eq(filtered)
    expect(errors).to be_nil

    filtered, errors = filter.filter(nil)
    expect(filtered).to be_nil
    expect(errors).to eq(:nils)
  end
end