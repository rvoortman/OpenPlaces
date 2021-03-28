# frozen_string_literal: true

class Api < Grape::API
  insert_before Grape::Middleware::Error

  version 'v1', using: :path
  formatter :json, Api::Formatters::SafeIntegerJson.new
  default_format :json
  cascade false

  include Api::Concerns::TimeZone
  include Api::Concerns::ErrorHandling

  before do
    I18n.locale = :en

    error!("Invalid content type", 406) unless %i[json xml].include?(env['api.format'])
  end

  after do
    header "Access-Control-Allow-Origin", "*"
    header "Access-Control-Allow-Methods", "GET, POST, PATCH, PUT, DELETE"
    header "Access-Control-Allow-Headers", "Authorization,Content-Type"
  end

  mount Api::Routes::PointOfInterests
  # mount Api::Routes::Categories
end
