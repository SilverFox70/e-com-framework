class CartItemsController < ApplicationController

  def create
    p cart_item_params.inspect
    if !authenticated?
      redirect_to root_path
    end
    new_item = CartItem.new(cart_item_params)
    new_item.cart_id = Cart.find_by(user_id: current_user.id).id
    new_item.save
    if request.xhr?
      render json: current_user.cart_items.count
    else
      redirect_to item_path(new_item.item)
    end
  end



  def update
    cart_item = CartItem.find_by(item_id: params[:id], cart_id: user_cart_id)
    cart_item.update(quantity: params[:qty])
    if request.xhr?
      render json: cart_item.quantity
    else
      redirect back
    end
  end

  def destroy
    cart_item = CartItem.find_by(item_id: params[:id], cart_id: user_cart_id)
    cart_item.destroy
    if request.xhr?
      render json: {id: cart_item.item.id, count: current_user.cart_items.count}
    else
      redirect back
    end
  end


  private

    def cart_item_params
      params.require(:cart_item).permit(:cart_id,:item_id,:quantity,:cart,:item)
    end

    def user_cart_id
      Cart.find_or_create_by(user_id: current_user.id).id
    end

end
