class UsersController < ApplicationController


def index

	@users = User.order('fullname ASC')
end



def show
	@user = User.find(params[:id])

end


private

def user_params

	params.require(:user).permit(:username, :firstname, :lastname, :gender, :email, :password)

end


def set_user
	@user = User.find(params[:id])
end




end
