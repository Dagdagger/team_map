class InstaconvosController < ApplicationController
  before_filter :authenticate_user!


  layout false


  def create
    if Instaconvo.between(params[:sender_id], params[:recipient_id]).present?
      @instaconvo = Instaconvo.between(params[:sender_id], params[:recipient_id]).first
    else
      @instaconvo = Instaconvo.create!(instaconvo_params)
    end

      render json: { instaconvo_id: @instaconvo.id }
  end


  def show
    @instaconvo = Instaconvo.find(params[:id])
    @receiver = interlocutor(@instaconvo)
    @supamessages = @instaconvo.supamessages
    @supamessage = Supamessage.new
  end


  private
  def instaconvo_params
    params.permit(:sender_id, :recipient_id)
  end


  def interlocutor(instaconvo)
    current_user == instaconvo.recipient ? instaconvo.sender : instaconvo.recipient
  end
end
