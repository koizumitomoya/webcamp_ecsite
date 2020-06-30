class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    protect_from_forgery with: :exception
    autocomplete :item, :name, full: true

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname, :name_kana, :surname_kana])
    end
end
