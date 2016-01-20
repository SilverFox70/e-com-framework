include UsersHelper

class UsersController < ApplicationController
  def index
    @users = User.order(:created_at)
    redirect_to '/' unless current_user && current_user.is_admin?
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.password = params[:password_plaintext]
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def make_admin
    @user = User.find(params[:id])
    @user.update(user_type: 1)
    redirect_to users_path
  end

  def make_customer
    @user = User.find(params[:id])
    @user.update(user_type: 0)
    redirect_to users_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :email,)
  end
end
