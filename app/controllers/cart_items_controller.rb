class CartItemsController < ApplicationController

  def create
    if !authenticated?
      redirect_to root_path
    end
    newItem = CartItem.new(item_id: params[:item_id])
    newItem.cart_id = Cart.find_by(user_id: session[:user_id]).id
    newItem.save
    redirect_to item_path(Item.find(params[:item_id]))
  end

end
