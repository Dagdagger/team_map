class CoachprofilesController < ApplicationController


  def new
		@coachprofile = current_coach.coachprofile
  end

  def index
    @coachprofiles = Coachprofile.all
  end


	def show
		@coachprofile = current_coach.coachprofile
		if @coachprofile.price == nil
			redirect_to action: "new"
		end
	end

  def publicshow
    @coachprofile = Coachprofile.find(params[:id])
  end

  def reviews
    @coachprofile = Coachprofile.find(params[:id])
    @reviews = @coachprofile.reviews.all
    @review = @coachprofile.reviews.new
  end


  def write
    @coachprofile = Coachprofile.find(params[:id])
    @review = @coachprofile.reviews.new(review_params)
    respond_to do |format|
      if @review.save
        format.html { redirect_to root_url, notice: 'Review was successfully added.'}
      else
        format.html do
          @reviews = Coachprofile.reviews.all
          flash.now[:error] = 'Failed to add review'
          redirect_to root_url
        end
      end
    end
  end

	def update
		if current_coach.coachprofile.update_attributes(coachprofile_params)
		redirect_to coachprofile_path
		end
	end

	def edit
		@coachprofile = current_coach.coachprofile
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


  def upvote
    @coachprofile= Coachprofile.find(params[:id])
    @coachprofile.upvote_by current_user
    redirect_to :back
  end

def downvote
  @coachprofile = Coachprofile.find(params[:id])
  @coachprofile.downvote_by current_user
  redirect_to :back
end


	private


	def coachprofile_params
	params.require(:coachprofile).permit(:phonenumber, :email, :image, :address, :description, :birthdate, :sport, :price, :firstname, :lastname)
	end

  def review_params
    params.require(:review).permit(:description, :rating, :title).merge(user_id: current_user.id )
  end


end
