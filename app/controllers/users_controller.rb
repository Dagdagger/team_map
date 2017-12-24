class UsersController < ApplicationController


def index
	@users = User.order('fullname ASC')
end



def show
	@user = current_user
	@profile = @user.profile
end


private

def user_params

	params.require(:user).permit(:email, :password, :name)

end


def set_user
	@user = User.find(params[:id])
end




end
