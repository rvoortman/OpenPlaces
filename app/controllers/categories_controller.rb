# frozen_string_literal: true

class CategoriesController < ApplicationController
  respond_to :html
  before_action :authenticate_user!

  def index
    @page_title = "Categories"
    @categories = Categories::ListCategories.run!(user: current_user)
  end

  def new
    @page_title = "New Category"
    @category = current_user.categories.build
  end

  def create
    @category = Categories::CreateCategory.run!(category_params.merge(user: current_user))

    if @category.persisted?
      redirect_to action: 'index'
    else
      respond_with(@category)
    end
  end

  def destroy
    @category = Categories::DestroyCategory.run!(user: current_user, id: id_param)

    redirect_to action: 'index'
  end

  def edit
    @page_title = "Edit Category"
    @category = Categories::FindCategory.run!(user: current_user, id: id_param)
  end

  def update
    @category = Categories::UpdateCategory.run!(category: category_params, user: current_user, id: id_param)

    if @category.valid?
      redirect_to action: 'index'
    else
      respond_with(@category)
    end
  end

  private

  def id_param
    params.require(:id)
  end

  def category_params
    params.require(:category).permit(:title, :color)
  end
end
