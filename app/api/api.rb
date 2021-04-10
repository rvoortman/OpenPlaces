# frozen_string_literal: true

class Api < Grape::API
  require 'doorkeeper/grape/helpers'
  version 'v1', using: :path
  formatter :json, PublicApi::Formatters::StringIdJson.new
  default_format :json
  cascade false

  include PublicApi::Concerns::TimeZone
  include PublicApi::Concerns::ErrorHandling

  before do
    I18n.locale = :en

    error!("Invalid content type", 406) unless %i[json xml].include?(env['api.format'])
    if params["access_token"]
      token = ::Doorkeeper::AccessToken.by_token(params["access_token"])

      raise(InvalidAccessTokenError, "access token invalid") if token.blank?
      raise(InvalidAccessTokenError, "access token expired") if token.expired?
      raise(InvalidAccessTokenError, "access token revoked") if token.revoked?

      #TODO: Use mutation
      @current_user = User.find(token.resource_owner_id)
    end
  end

  after do
    header "Access-Control-Allow-Origin", "*"
    header "Access-Control-Allow-Methods", "GET, POST, PATCH, PUT, DELETE"
    header "Access-Control-Allow-Headers", "Authorization,Content-Type"
  end

  mount PublicApi::Routes::PointOfInterests
  mount PublicApi::Routes::Categories
end
