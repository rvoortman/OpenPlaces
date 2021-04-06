# frozen_string_literal: true

module Users
  class ConfirmationsController < Devise::ConfirmationsController
    layout "session"
  end
end
