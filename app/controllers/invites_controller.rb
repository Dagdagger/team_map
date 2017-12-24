class InvitesController < ApplicationController
def new
  @invite = Invite.new
  @invite.event_id = params[:id]
  end

  def create
    @invite = Invite.new(invite_params) # Make a new Invite
    @invite.sender_id = current_user.id # set the sender to the current user
    if @invite.save
       InviteMailer.invite(@invite, join_path(@invite.event_id)).deliver #send the invite data to our mailer to deliver the email
       redirect_to events_url, notice: 'Invitation was successfully created.'
    else
         redirect_to events, notice: 'Invitation Failed'
    end
   end

   private
  def invite_params
      params.require(:invite).permit(:sender_id, :email, :event_id, :recipient_id, :username)
    end
  end
