class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    redirect_to users_path
  end

  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.json {render json: @users}
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    user = User.find params[:id]
    user.update user_params
    redirect_to users_path
  end

  def destroy
    user = User.find params[:id]
    user.destroy
    redirect_to users_path

  end

  #private methods below
  private

  def user_params
    #Submitted params MUST be the below
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end
end
