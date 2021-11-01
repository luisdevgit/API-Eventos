class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    rescue_from CanCan::AccessDenied do
        flash[:error] = 'Access denied!'
        redirect_to root_url
    end

    protected
    protect_from_forgery unless: -> { request.format.json? }
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :role_id) }
        devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me, :role_id) }
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:role_id, :email, :password, :password_confirmation,:reset_password_token) }
    end
end
