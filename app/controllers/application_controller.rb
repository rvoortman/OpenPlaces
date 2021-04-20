# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from Mutations::ValidationException, with: :render_validation_error

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || category_index_path
  end

  def render_validation_error(exception)
    raise exception unless Rails.env.production? || Rails.env.test?

    uniq_error_message = exception.errors.values.map(&:symbolic).uniq
    uniq_error_message = uniq_error_message.map(&:values).flatten if uniq_error_message.first.kind_of?(Hash)
    case uniq_error_message
    when [:not_found], [:date_range], [:order], [:no_access] then render_not_found
    when [:insufficient_permissions] then render_forbidden
    else
      Rails.logger.info exception.errors.inspect
      raise exception
    end
  end

  def render_not_found
    render html: File.read(Rails.root.join("public", "404.html")).html_safe, status: 404
  end

  def render_forbidden
    render html: File.read(Rails.root.join("public", "403.html")).html_safe, status: 403
  end
end
