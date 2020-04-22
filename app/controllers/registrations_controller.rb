class RegistrationsController < Devise::RegistrationsController
   before_action :update_sanitized_params

   def update_sanitized_params
       devise_parameter_sanitizer.permit(:sign_up, keys: [:login, :realName, :major_id, :email, :password, :password_confirmation])
   end
end
