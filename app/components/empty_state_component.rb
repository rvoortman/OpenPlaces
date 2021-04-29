# frozen_string_literal: true

class EmptyStateComponent < ViewComponent::Base
  def initialize(missing_element:, add_link:)
    @missing_element = missing_element
    @add_link = add_link
  end
end
