# frozen_string_literal: true

class Api < Grape::API
  version 'v1', using: :path
  formatter :json, PublicApi::Formatters::StringIdJson.new
  default_format :json
  cascade false

  include PublicApi::Concerns::TimeZone
  include PublicApi::Concerns::ErrorHandling

  before do
    I18n.locale = :en

    error!("Invalid content type", 406) unless %i[json xml].include?(env['api.format'])
  end

  after do
    header "Access-Control-Allow-Origin", "*"
    header "Access-Control-Allow-Methods", "GET, POST, PATCH, PUT, DELETE"
    header "Access-Control-Allow-Headers", "Authorization,Content-Type"
  end

  mount PublicApi::Routes::PointOfInterests
  mount PublicApi::Routes::Categories
end
