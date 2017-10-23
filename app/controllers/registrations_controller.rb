class RegistrationsController < Devise::RegistrationsController

	def create
		super
		if resource.save
			resource.create_profile
		end
	end

	def destroy
		super

		if resource.destroy
			@profile = Profile.find(user_id: resource.id)
			@profile.destroy
		end
	end


	private

	def sign_up_params
		devise_parameter_sanitizer.sanitize(:sign_up)
		params.require(:user).permit(:firstname, :lastname, :email, :gender, :password, :password_confirmation)
	end

	def account_update_params
		params.require(:user).permit(:firstname, :lastname, :email, :gender, :password, :password_confirmation , profile: [ :id, :age, :address, :description, :birthdate])
	end
end
