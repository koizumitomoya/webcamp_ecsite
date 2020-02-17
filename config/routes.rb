Rails.application.routes.draw do
  namespace :admin do
   
  end
  devise_for :end_users, :controllers => {
    :registrations => 'end_users/registrations',
    :sessions => 'end_users/sessions'   
  } 

  devise_scope :end_user do
    get "sign_in", :to => "end_users/sessions#new"
    get "sign_out", :to => "end_users/sessions#destroy" 
  end

  get 'end_users/:id', :to => 'end_users#show', as: :end_users_mypage
 namespace :admin do 
   get "items", :to => "items#index"
 end
 devise_for :admins, path: :admin, :controllers => {
   
  :sessions => 'admins/sessions'   
} 
devise_scope :admin do
  get "admin/sign_in", :to => "admins/sessions#new"
  get "admin/sign_out", :to => "admins/sessions#destroy" 
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

