class LeaguesController < ApplicationController

  def index
    @leagues = League.all
  end

  def join
    if current_user.captain
  end
end
