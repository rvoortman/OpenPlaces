# frozen_string_literal: true

class CategoryController < ApplicationController
  before_action :authenticate_user!

  def index
    @page_title = "Categories"
    @categories = Categories::ListCategories.run!
  end
end
