# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_context :api_context do
  def request(method, path, params: nil, headers: nil, as: nil)
    full_path = "/api/v1/#{path}"
    send(method, full_path, params: params, headers: headers, as: as)
  end

  def parsed_response
    JSON.parse(response.body)
  end

  RSpec::Matchers.define :be_a_representation_of do |expected, options|
    include RSpec::Matchers::Composable
    define_method :expected_keys do
      return {} if expected.nil?

      klass = options && options[:entity] ? options[:entity] : expected

      "PublicApi::Entities::#{klass}".constantize.new(expected).root_exposures.map(&:attribute).map(&:to_s)
    end

    match do |actual|
      values_match?(expected_keys, actual.keys)
    end

    failure_message do |actual|
      "expected representation:\n   #{expected_keys}\nbut API returned:\n   #{actual}"
    end
  end

  RSpec::Matchers.define :have_status do |expected|
    match do |actual|
      actual.status == expected
    end

    failure_message do |actual|
      msg = "expected request to have status #{expected}, got status #{actual.status} (#{actual.message})"
    end
  end
end
