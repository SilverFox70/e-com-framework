include UsersHelper

class UsersController < ApplicationController
  before_action :check_permissions, except: [:index, :show, :new, :create]

  def index
    redirect_to '/' unless current_user && current_user.is_admin?
    @users = User.order(:created_at)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    redirect_to '/' unless current_user && current_user == @user
  end

  def create
    p "params @create: #{params.inspect} "
    @user = User.new(user_params)
    @user.password = params[:password_plaintext]
    p "-" * 40
    p @user
    p "-" * 40
    if @user.save
      Cart.create(user_id: @user.id)
      session[:user_id] = @user.id
      redirect_to '/'
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    redirect_to '/' unless current_user && current_user == @user
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def make_admin
    redirect_to '/' unless current_user && current_user.is_admin?
    @user = User.find(params[:id])
    @user.update(user_type: 1)
    redirect_to users_path
  end

  def make_customer
    redirect_to '/' unless current_user && current_user.is_admin?
    @user = User.find(params[:id])
    @user.update(user_type: 0)
    redirect_to users_path
  end

  def destroy
    redirect_to '/' unless current_user && current_user.is_admin?
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :email,)
  end
end
