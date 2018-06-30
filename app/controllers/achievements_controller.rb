class AchievementsController < ApplicationController

  def index
  		@profile = Profile.find(params[:id])
  		@achievements = @profile.achievements.all
  end

  def new
    @profile = Profile.find(params[:id])
    @achievement = @profile.achievements.new
  end

  def edit
    @profile = Profile.find(params[:id])
    @achievements = @profile.achievements.all
  end

  def update
  end




  def create
    @profile = Profile.find(params[:id])
    @achievement = @profile.achievements.new(achievement_params)
    respond_to do |format|
      if @achievement.save
        format.html { redirect_to root_url, notice: 'Achievement was successfully added.'}
      else
        format.html do
          @achievements = @profile.achievements.all
          flash.now[:error] = 'Failed to add achievement'
          redirect_to root_url
        end
      end
    end
  end


  def destroy
  @profile = Profile.find(params[:id])
  @profile.destroy
  respond_to do |format|
    format.html { redirect_to groups_url, notice: 'Achievement was successfully destroyed.' }
    format.json { head :no_content }
    end
  end



  private

  def achievement_params
  	params.require(:achievement).permit(:name, :description, :sport, :name)
  end




end
