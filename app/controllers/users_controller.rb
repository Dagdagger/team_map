class UsersController < ApplicationController


def index

	@users = User.order('fullname ASC')
end



def show
	@user = User.find(params[:id])

end


private


def set_user
	@user = User.find(params[:id])
end




end
