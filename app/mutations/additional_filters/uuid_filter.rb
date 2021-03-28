# frozen_string_literal: true

module Mutations
  class UUIDFilter < AdditionalFilter
    @default_options = {
      nils: false
    }

    UUID = /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i.freeze

    def filter(data)
      data = nil if options[:empty_is_nil] && data == ''
      if data.nil?
        return [nil, nil] if options[:nils]

        return [nil, :nils]
      end

      return [data, :empty] if data == ''

      return [nil, :uuid] unless data.kind_of?(String)

      [data, nil]
    end
  end
end
