class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(id: params[:id])

    return unless @category.nil?

    redirect_to categories_path
    flash[:alert] = 'Category not found.'
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

  def edit
    @category = Category.find_by(id: params[:id])

    return unless @category.nil?

    redirect_to categories_path
    flash[:alert] = 'Category not found.'
  end

  def update
    @category = Category.find_by(id: params[:id])

    if @category.update(category_params)
      redirect_to category_path(@category)
      flash[:notice] = 'Category successfully updated.'
    else
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
