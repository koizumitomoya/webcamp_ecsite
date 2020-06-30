class AddressesController < ApplicationController
    before_action :authenticate_end_user!
    def new
      @address = Address.new
    end
    def create
        @address = Address.new(address_params)
        @address.end_user_id = current_end_user.id
        @address.save
        redirect_to new_order_path
    end   
    def index
    end   
    def edit
         @address = Address.find(params[:id])
    end     
    def update
        @address = Address.find(params[:id])
        @address.update(address_params)
        redirect_to addresses_path
    end    
    
    private
    def address_params
        params.require(:address).permit(:end_user_id, :postcode, :address, :name)
    end    
end
