# frozen_string_literal: true

module PublicApi
  module Formatters
    class StringIdJson
      MAX_SAFE_INTEGER = 2**53 - 1

      def call(object, env)
        Grape::Formatter::Json.call(serialize(object), env)
      end

      private

      def serialize(object)
        if object.kind_of?(Time) || object.kind_of?(DateTime)
          object.utc
        elsif object.kind_of?(Integer)
          object > MAX_SAFE_INTEGER ? object.to_s : object
        elsif object.respond_to?(:to_ary)
          object.to_ary.map {|value| serialize(value) }
        elsif object.kind_of?(Hash)
          object.transform_values {|value| serialize(value) }
        elsif object.respond_to?(:serializable_hash)
          object.serializable_hash
        else
          object
        end
      end
    end
  end
end
