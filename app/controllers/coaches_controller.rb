class CoachesController < ApplicationController
  def index
  @coaches = Coach.all
  end



  private

  def user_params
  	params.require(:user).permit(:username, :firstname, :lastname, :gender, :email, :password)
  end
end
