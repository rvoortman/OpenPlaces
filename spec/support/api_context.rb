# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_context :api_context do
  include_context :user_context

  let(:doorkeeper_application) { Doorkeeper::Application.create!(name: "Test Application", redirect_uri: "https://foo.bar") }
  let(:user) { create_user }
  let(:access_token) { Doorkeeper::AccessToken.create!(application_id: doorkeeper_application.id, resource_owner_id: user.id, scopes: :public) }

  def request(method, path, params: nil, headers: nil, as: nil, authenticated: true)
    if authenticated
      params ||= {}
      params[:access_token] = access_token.token
    end
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
      "expected request to have status #{expected}, got #{actual.status} (#{actual.message})"
    end
  end
end
