class Administrator::CategoriesController < ApplicationController
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Successfully Create Category."
      redirect_to administrator_categories_path
    else
      render 'new_administrator_category'
    end
  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 6)  
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "Successfully updated Categories."
      redirect_to administrator_categories_path
    else
      render 'edit_administrator_category'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to administrator_categories_path
  end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end

end
