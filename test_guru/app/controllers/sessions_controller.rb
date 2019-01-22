class SessionsController < ApplicationController
  def new; end

  def create
    console
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:redirect_path]
    else
      flash.now[:alert] = 'Login failed! Verify Email and Password please'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    cookies.delete :redirect_path
    redirect_to root_path
  end
end
