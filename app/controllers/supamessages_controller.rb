class SupamessagesController < ApplicationController


  before_filter :authenticate_user!

  def create
   @instaconvo = Instaconvo.find(params[:instaconvo_id])
   @supamessage = @instaconvo.supamessages.build(supamessage_params)
   @supamessage.user_id = current_user.id
   @supamessage.save!

   @path = instaconvo_path(@instaconvo)
   PrivatePub.publish_to "/chatroom", :instaconvo_id => @instaconvo.id, :receiver_id => @instaconvo.recipient_id
  end

 private

 def supamessage_params
   params.require(:supamessage).permit(:body)
 end
end
