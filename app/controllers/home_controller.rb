class HomeController < ApplicationController
  def index
    session[:conversations] ||= []

    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :instamessages)
                                 .find(session[:conversations])
  end

  def conditions
  end
end
