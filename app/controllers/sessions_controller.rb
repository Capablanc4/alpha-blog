class SessionsController < ApplicationController
  def new
    
  end

  def create
    #debugger
    user = User.find_by(email: params["email"].downcase)
    if user && user.authenticate(params["password"])
      session[:user_id] = user.id
      flash[:notice] = "You have successfully logged in"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "There is something wrong with your login information"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have logged out"
    redirect_to root_path
  end

end
