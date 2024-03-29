class CategoriesController < ApplicationController
  include CategoriesHelper
  def index
    @categories = current_user.categories.includes(:payments)
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)

    if @category.save
      redirect_to categories_path
      flash[:notice] = 'Category successfully created.'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
