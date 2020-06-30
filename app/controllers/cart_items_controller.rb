class CartItemsController < ApplicationController
  before_action :authenticate_end_user!

    def index
      @user = current_end_user
      @carts = current_end_user.cart_items
        
    end
    def show
        @cart = Item.CartItem.new
        @user = current_end_user
        @carts = current_end_user.cart_items
    end    
    def create
      
     if current_end_user.cart_items.find_by(item_id: params[:item_id]).present?
      @cart_items = current_end_user.cart_items
      @cart_items.each do |cart_item|
      if cart_item == current_end_user.cart_items.find_by(item_id: params[:item_id])
         sum = cart_item.amount.to_i + cart_item_params[:amount].to_i
         cart_item.update_attributes(amount: sum)
         redirect_to  cart_items_path
      else   
        
      end
      end  
        
       
     else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.end_user_id = current_end_user.id
      @cart_item.item_id = params[:item_id]
      @cart_item.save
      redirect_to cart_items_path      
     end
    end 
    
    def same_items
      @cart_items = current_end_user.cart_items
      @cart_items.each do |cart_item|
      if cart_item.item_id == current_end_user.cart_items.find_by(item_id: 2)  
         sum = cart_item.amount.to_i + params[:cart_item][:amount].to_i
         cart_item.update_attributes(amount: sum)
         redirect_to  cart_items_path
      else   
      end
      end  

    end  

    def update
      @cart = CartItem.find(params[:id])
      @cart.update(cart_item_params)
      @cart.end_user_id = current_end_user.id
      redirect_to cart_items_path
    end
    def destroy
      cart = CartItem.find(params[:id])
      cart.destroy
      redirect_to cart_items_path
    end    
    def destruction
      @carts = current_end_user.cart_items
      @carts.each do |cart|
        cart.destroy
      end  
      redirect_to cart_items_path

    end  
      


    private

    
    def cart_item_params
      params.require(:cart_item).permit(:amount, :item_id)
    end

 

         
end
