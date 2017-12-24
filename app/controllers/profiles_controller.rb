class ProfilesController < ApplicationController

	def new
		@profile = current_user.profile
	end



	def publicshow
		@profile = Profile.find(params[:id])
	end


	def show
		@activities = PublicActivity::Activity.where(owner: current_user).paginate(page: params[:page],per_page: 10)
		@profile = current_user.profile
		if @profile.displayname == nil
			redirect_to action: "new"
		end
	end

	def update
		if current_user.profile.update_attributes(profile_params)
		redirect_to profile_path
		end
	end

	def edit
		@profile = current_user.profile
	end

	def create
		@profile = current_user.new_profile(profile_params)

		respond_to do |format|
		if @profile.save
			redirect_to profile_path
		else
			format.html { redirect_to root_url, notice: 'Error in creating Profile' }
		end
		end
	end


	def upvote
  @profile = Profile.find(params[:id])
  @profile.upvote_by current_user
  redirect_to :back
end

def downvote
  @profile = Profile.find(params[:id])
  @profile.downvote_by current_user
  redirect_to :back
end



	private

	def profile_params
	params.require(:profile).permit(:image,:displayname, :age, :address, :description, :birthdate, :sport, :sportdescription, :skill)
	end
end
