class CoachprofilesController < ApplicationController

  def new
		@coachprofile = current_coach.coachprofile
	end

	def show
		@coachprofile = current_coach.coachprofile
		if @coachprofile.description == nil
			redirect_to action: "new"
		end
	end

	def update
		if current_coach.coachprofile.update_attributes(coachprofile_params)
		redirect_to coachprofile_path
		end
	end

	def edit
		@coachprofile = current_coach.profile
	end

	def create
		@coachprofile = current_coach.new_coachprofile(coachprofile_params)

		respond_to do |format|
		if @coachprofile.save
			redirect_to coachprofile_path
		else
			format.html { redirect_to root_url, notice: 'Error in creating Coach Profile' }
		end
		end
	end


	private

	def coachprofile_params
	params.require(:coachprofile).permit(:address, :description, :birthdate, :sport, :description, :price, :firstname, :lastname, )
	end
end
