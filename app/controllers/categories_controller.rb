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
    @category = Categories::CreateCategory.run!(params_with_user(params.require(:category).permit!))

    if @category.persisted?
      redirect_to action: 'index'
    else
      respond_with(@category)
    end
  end

  def destroy
    @category = Categories::DestroyCategory.run!(params_with_user(id: params.require(:id)))

    redirect_to action: 'index'
  end

  def edit
    @page_title = "Edit Category"
    @category = Categories::FindCategory.run!(params_with_user(id: params.require(:id)))
  end

  def update
    @category = Categories::UpdateCategory.run!(params_with_user(params.permit!))

    if @category.valid?
      redirect_to action: 'index'
    else
      respond_with(@category)
    end
  end

  private

  def params_with_user(parameters)
    parameters.to_h.merge(user: current_user)
  end
end
