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
       @array = [] 
       render :new if @order.invalid?
       
       

    end
    def create
        order = Order.new(order_params)
        order.end_user_id = current_end_user.id
        if order.save
           cart_items = current_end_user.cart_items
           cart_items.each do |cart_item|
             item = cart_item.item
             order_detail = OrderDetail.new(item_id: cart_item.item_id, order_id: order.id, amount: cart_item.amount, price: item.price * cart_item.amount, status: 0)
             order_detail.save
           end
    
           redirect_to finsh_orders_path
        end
    end      
      
        
        
    
    def finsh
        
    end
    def index
    end
    def show

    end   
    
    private
    def  order_params
        params.require(:order).permit(:end_user_id,  :method, :address_id, :total, :status　0, :postage)
    end
end
