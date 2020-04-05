class ItemsController < ApplicationController
  def index
    if params[:item] && params[:item][:name]
      item_name = params[:item][:name]
      @items = Item.where("name LIKE '%#{item_name}%'")
    else
    @items = Item.all
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @cart_item.item_id = Item.find(params[:id])
  end
end
