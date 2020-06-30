class OrdersController < ApplicationController
    before_action :authenticate_end_user!
    def new
        @order = Order.new
        @carts = current_end_user.cart_items
    end
    def confirm
        
       @order = Order.new(order_params)
       @order.end_user_id =current_end_user.id
       @carts =current_end_user.cart_items
       if params[:order][:address_option] == "0"
        
        @order.delivery_postcode = current_end_user.postcode
        @order.delivery_address = current_end_user.address
        @order.delivery_name = current_end_user.surname + current_end_user.name
        
    elsif params[:order][:address_option] == "1"
        @order.delivery_postcode = @order.address.postcode
        @order.delivery_address = @order.address.address
        @order.delivery_name = @order.address.name
        
    elsif params[:order][:address_option] == "2"
        redirect_to new_address_path
    end          
       @array = [] 
       render :new if @order.invalid?
       
       

    end
    def create
        @order = Order.new(order_params)
        @order.end_user_id = current_end_user.id
        binding.pry
          
        if @order.save
           cart_items = current_end_user.cart_items
           cart_items.each do |cart_item|
             item = cart_item.item
             order_detail = OrderDetail.new(item_id: cart_item.item_id, order_id: @order.id, amount: cart_item.amount, price: item.price * cart_item.amount, status: 0)
             order_detail.save
            end
            current_end_user.cart_items.each do |cart|
            cart.destroy
            end    
    
           redirect_to finsh_orders_path
        end
    end      
      
        
        
    
    def finsh
        
    end
    def index
    end
    def show
        @order = Order.find(params[:id])

    end   
    
    private
    def  order_params
        params.require(:order).permit(:end_user_id,  :method, :address_id, :total, :status, :postage, :delivery_postcode, :delivery_name, :delivery_address)
    end
end
