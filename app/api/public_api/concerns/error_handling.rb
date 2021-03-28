# frozen_string_literal: true

module PublicApi
  module Concerns
    module ErrorHandling
      extend ActiveSupport::Concern

      included do
        rescue_from :all do |e|
          raise e if Rails.env.test?

          error!(error: "Something went terribly wrong!")
        end

        rescue_from Grape::Exceptions::ValidationErrors do |e|
          error!({ error: e.message }, e.status)
        end

        rescue_from Grape::Exceptions::MethodNotAllowed do |e|
          error!({ error: "The request method is not allowed for this endpoint." }, 405)
        end

        rescue_from Grape::Exceptions::InvalidMessageBody do |e|
          error!({ error: "The request body couldn't be parsed because it's invalid." }, 400)
        end

        rescue_from Mutations::ValidationException do |e|
          status = case e.errors.symbolic.values.uniq
                   when [:not_found] then 404
                   when [:invalid_grant] then 401
                   when [:limit_reached] then 402
                   else 400
                   end

          message = e.to_s
          # replace 'xx is invalid' message in 404 case with better fitting message
          message = "record not found" if status == 404 && message =~ /invalid/i

          error!({ error: message, symbolic: e.errors.symbolic }, status)
        end

        rescue_from PublicApi::Concerns::TimeZone::InvalidTimezone do |error|
          error!(
            { error: "A time zone was provided, but it couldn't be recognized: #{error.time_zone}. Make sure you provide a time zone from the tz database." }, 400
          )
        end

        helpers do
          def present(instance, with: nil)
            return super unless instance.try(:errors)&.any? || instance.try(:invalid?)

            error!({ error: instance.errors }, 422)
          end
        end
      end
    end
  end
end
