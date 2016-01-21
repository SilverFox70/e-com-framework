include UsersHelper

class ItemsController < ApplicationController
  before_action :check_permissions, except: [:index, :show]

  def index
    @items = Item.order(:created_at)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item
    else
      render 'new'
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to @item
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :quantity, :picture_url, :upc, :price)
  end

  def check_permissions
    if !current_user
      flash[:error] = "You must log in to complete that action."
    elsif !current_user.is_admin?
      flash[:error] = "You are not authorized to complete that action."
    end
    redirect_to new_session_url unless (current_user && current_user.is_admin?)
  end
end
