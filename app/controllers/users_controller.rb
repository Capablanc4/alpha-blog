class UsersController < ApplicationController
  def new
    @user = User.new  
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the alpha blog #{@user.username}"
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your account was updated successfully"
      redirect_to articles_path
    end
  end

  def show 
    @user = User.find(params[:id])
  end









  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
