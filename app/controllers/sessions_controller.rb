class SessionsController < ApplicationController
  def new
    # Login Page
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:info] = "Welcome, #{user.name}!"
      redirect_to admin_menu_path
    else
      flash.now[:danger] = "Invalid email/password combination!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, info: "You're now signed out!"
  end
end
