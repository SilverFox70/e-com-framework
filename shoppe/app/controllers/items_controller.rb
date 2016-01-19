class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
  end

  def create
    @item = Item.new(item_params)
    @item.price = @item.price * 100
    p @item.price
    @item.save
    redirect_to @item
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :description, :quantity, :picture_url, :upc)
  end
end
