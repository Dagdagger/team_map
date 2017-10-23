class TrainersController < ApplicationController
  def index
	  @trainers = Trainer.all
  end


  def show
	  @trainer = trainer.find(params[:id])
  end

end
