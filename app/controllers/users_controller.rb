class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  def index
    @pagy, @users = pagy(User.all)
  end
  
  def new
    @user = User.new  
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to the alpha blog #{@user.username}"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update 
    if @user.update(user_params)
      flash[:notice] = "Your account was updated successfully"
      redirect_to articles_path
    end
  end

  def show 
    @pagy, @articles = pagy(@user.articles)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User and all articles crates by user have been deleted"
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if logged_in? && current_user != @user && !current_user.admin?
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end

  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "Only admin users can perform that action"
      redirect_to root_path
    end
  end
end
