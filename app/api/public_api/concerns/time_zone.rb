# frozen_string_literal: true

module PublicApi
  module Concerns
    module TimeZone
      extend ActiveSupport::Concern

      class InvalidTimezone < StandardError
        attr_reader :time_zone

        def initialize(message, time_zone)
          super(message)
          @time_zone = time_zone
        end
      end

      included do
        helpers do
          def set_time_zone
            Time.zone = user_provided_time_zone || default_time_zone
          end

          def reset_time_zone
            Time.zone = default_time_zone
          end

          private

          def user_provided_time_zone
            Time.find_zone!(headers["Time-Zone"].presence)
          rescue ArgumentError
            raise InvalidTimezone.new("Invalid time zone", headers["Time-Zone"])
          end

          def default_time_zone
            "UTC"
          end
        end
      end
    end
  end
end
