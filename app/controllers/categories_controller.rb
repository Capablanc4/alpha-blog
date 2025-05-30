class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]
  def index
    @pagy, @categories = pagy(Category.all)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was created successfully"
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Category was successfully updated"
      redirect_to categpry_path(@category)
    end
  end

  def show
    @category = Category.find(params[:id])
    @pagy, @category_articles = pagy(@category.articles)
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    #redirect_to categories_path unless current_user&.admin? #solucion de Claude
    if !current_user&.admin?#!logged_in? || (logged_in? and !current_user.admin?)
      flash[:danger] = "Only admins can perform that action"
      redirect_to categories_path
    end
  end


end