class ApplicationController < ActionController::Base
  before_action :fetch_user

  def fetch_user
    #check to ensure that the user is logged in
    if session[:user_id].present?
      #.find_by instead of .find so if it's not present it won't be an error.
      @current_user = User.find_by id: session[:user_id]
      if @current_user.admin == false
        flash[:error] = "ERROR: Only Admins are able to log into this system."
        session[:user_id] = nil
        redirect_to login_path
      end
    end
    #force logout if user ID isn't found.
    unless session[:user_id].present?
      session[:user_id] = nil
    end
  end#fetch_user
end
