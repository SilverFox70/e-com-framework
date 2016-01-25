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
    p "params @create: email:#{params["email"]}, pwd:#{params["password_plaintext"]} "
    @user = User.find_by_email(params["email"])
    p "*" * 40
    p "A user #{User.first}"
    p "#" * 40
    p @user
    if @user && @user.authenticate(params["password_plaintext"])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      session.delete(:user_id)
      @error = "Please check your email address and password and try again. User: #{@user} \n password #{params["password_plaintext"]}"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
