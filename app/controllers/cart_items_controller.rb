class CartItemsController < ApplicationController


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
     
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.end_user_id = current_end_user.id
      @cart_item.item_id = params[:item_id]
      

      if @cart_item.save
         redirect_to cart_items_path
      else 

       redirect_to  items_path
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
      


    private

    
    def cart_item_params
      params.require(:cart_item).permit(:amount, :item_id)
    end

 

         
end
