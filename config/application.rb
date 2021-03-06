# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dir["app/mutations/additional_filters/*.rb"].each {|f| load f, false }

module OpenPlaces
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.time_zone = "UTC"

    config.paths.add "app/api", glob: "**/*.rb"

    config.active_record.schema_format = :sql
  end
end
