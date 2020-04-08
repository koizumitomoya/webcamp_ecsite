Rails.application.routes.draw do
  resources :addresses
  resources :orders, only: [:index, :show, :create, :new] do 
    collection do
      post :confirm
      get :finsh
    end
  end    
  resources :items, only: [:index, :show] do
    get :autocomplete_item_name, on: :collection 
  end  
  resources :end_users, only: [:edit, :update, :destroy ] 
  resources :cart_items, only: [:show, :update, :create, :destroy, :index]
    delete "destruction", :to => "cart_items#destruction"
 
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
   resources :order_details, only:[:update]
   resources :items, only: [:index, :new, :create, :update, :edit]
   resources :genres, only: [:index, :create, :edit, :update]
   resources :orders, only: [:index, :show, :update]
   get "end_users", :to =>"end_users#index"
   delete "end_user/:id", :to =>"end_users#destroy"
   get "", :to =>"end_users#top"

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

