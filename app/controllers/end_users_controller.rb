class EndUsersController < ApplicationController
  before_action :authenticate_end_user!
     def show
        @end_user = EndUser.find(params[:id])
     end
     def edit 
       @end_user = EndUser.find(params[:id])
     end
     def update  
       @end_user = EndUser.find(params[:id])
        if @end_user.update(end_user_params)
          flash[:notice] = "you have updated your info successfully."
          redirect_to  end_users_mypage_path(current_end_user.id)
        else 
         render :edit
        end 
    end
    def destroy
      @end_user= EndUser.find(params[:id])
      @end_user.destroy
      redirect_to new_end_user_registration_path
    end     
    private

    def end_user_params
        params.require(:end_user).permit(:name, :surname, :name_kana, :surname_kana,:email,:postcode, :address, :phone_number)
    end

end
