# frozen_string_literal: true

class CategoryController < ApplicationController
  before_action :authenticate_user!

  def index
    @page_title = "Categories"
  end
end
