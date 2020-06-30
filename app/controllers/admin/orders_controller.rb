class Admin::OrdersController < ApplicationController
    before_action :authenticate_admin!

    def index
        @orders = Order.all

    end
    def show
        @order = Order.find(params[:id])
        @order_details = @order.order_details
    end
    def update
        binding.pry
        @order = Order.find(params[:id])
        if params[:order][:status] == "入金確認"

           @order.order_details.each do |detail|
           detail.status = "製作待ち" 
           detail.update(status: detail.status)
           end
       
         
        end   
        @order.update(order_params)
        redirect_to admin_order_path(@order)
    end   

    private
    def order_params
    params.require(:order).permit(:status)
    end
end



