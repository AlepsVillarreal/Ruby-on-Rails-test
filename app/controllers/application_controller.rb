class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  # Whitelist the following form fields so that we can process them (para no agregar otra columna a traves de javascript) si viene de un formulario de sign up de Devise
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Whitelist the following form fields so that we can process them (para no agregar otra columna a traves de javascript)
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:stripe_card_token, :email, :password, :password_confirmation) }
    end
end
