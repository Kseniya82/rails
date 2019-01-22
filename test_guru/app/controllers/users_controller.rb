class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.access = 'user'
    @user.name = 'user_name'
    if @user.save
      session[:user_id] = @user.id
      current_user
      redirect_to tests_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
