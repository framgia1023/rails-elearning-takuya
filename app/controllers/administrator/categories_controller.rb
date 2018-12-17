class Administrator::CategoriesController < ApplicationController
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Successfully Create Category."
      redirect_to administrator_categories_url
    else
      flash[:danger] = "Invaild Credentials."
      render 'administrator/categories/new'
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
      flash[:success] = "Successfully Updated Categories."
      redirect_to administrator_categories_url
    else
      flash[:danger] = "Invaild Credentials."
      render 'administrator/categories/edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to administrator_categories_url
  end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end

end
