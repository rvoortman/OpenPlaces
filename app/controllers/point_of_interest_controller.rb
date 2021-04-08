# frozen_string_literal: true

class PointOfInterestController < ApplicationController
  before_action :authenticate_user!

  def index
    @page_title = "Point of interests"
  end
end
