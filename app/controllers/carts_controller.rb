class CartsController < ApplicationController

  def index
    # render 'cart_items/_show', layout: false
    render partial: "cart_items/show"
  end

  def destroy
    cart = Cart.find(params[:id])
    cart.cart_items.each do |item|
      item.destroy
    end
    if request.xhr?
      render nothing: true
    else
      redirect_to root_path
    end
  end


end
