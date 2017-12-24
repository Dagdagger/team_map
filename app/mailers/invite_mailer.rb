class InviteMailer < ApplicationMailer
  def invite(invite, url)
    @invite = invite
    @user = @invite.username
    @url = url
    mail(to: invite.email, subject: 'You have been invited')
  end
end
