class UserMailer < ApplicationMailer
  def hire_email(user, email)
    @user = current_user
    mail(to: @user.email, subject: '')
  end


  def event_mail(user)
    @user = current_user
  end

end
