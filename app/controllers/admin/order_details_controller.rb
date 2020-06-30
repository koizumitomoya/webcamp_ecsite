class Admin::OrderDetailsController < ApplicationController
    before_action :authenticate_admin!

    def update
    order_detail = OrderDetail.find(params[:id])
    if params[:order_detail][:status] == "製作中"
        
       order_detail.order.status = "制作中"
       order_detail.order.update(status: order_detail.order.status)
    end   

      order_detail.update(order_detail_params)
      
     
      order_detail.order.order_details.each do |detail|
      if detail.status == "製作完了"

      else
        redirect_to admin_order_path(order_detail.order)
      end
      binding.pry  
        order_detail.order.status = "発送準備中"
        order_detail.order.update(status: order_detail.order.status)
      
     end
    redirect_to admin_order_path(order_detail.order)
    end 
    
    
    private
    def order_detail_params
    params.require(:order_detail).permit(:status)
    end
end



