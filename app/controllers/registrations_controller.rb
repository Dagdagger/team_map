class RegistrationsController < Devise::RegistrationsController

	def after_sign_up_path_for(resource)
       profile_path(resource)
     end

	private

	def sign_up_params
		devise_parameter_sanitizer.sanitize(:sign_up)
		params.require(:user).permit(:email,:password, :password_confirmation)
	end

	def account_update_params
		params.require(:user).permit(:email,:password, :password_confirmation)
	end
end
