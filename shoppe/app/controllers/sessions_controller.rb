include UsersHelper

class SessionsController < ApplicationController
  def new
    if authenticated?
      redirect_to '/'
    else
      render 'new'
    end
  end

  def create
    # where login form POSTs to
    @user = User.find_by_email(params["user"]["email"])
    if @user && @user.authenticate(params["password_plaintext"])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      session.delete(:user_id)
      @error = "Please check your email address and password and try again."
      render 'new'
    end
  end

  def destroy
    # where logout link goes to
    session[:user_id] = nil
    redirect_to '/'
  end
end
