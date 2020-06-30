class Admin::EndUsersController < ApplicationController
  before_action :authenticate_admin! , only: [:index , :destroy]
  def index
     @end_users = EndUser.with_deleted
  end
  def destroy
    @end_user= EndUser.find(params[:id])
    @end_user.destroy
    redirect_to admin_end_users_path
  end     
  def top
  end  
end

