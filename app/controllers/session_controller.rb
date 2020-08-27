class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:email]
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Details entered don't match our Database. Please check your email and password and try again."
      redirect_to login_path
    end
  end# create

  def destroy
    #end the session and redirect to the login page
    session[:user_id] = nil
    redirect_to login_path
  end
end
