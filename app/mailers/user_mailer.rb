class UserMailer < ApplicationMailer
  default from: 'shubham@auth.com'

  def send_welcome_email(user)
    @user = user
    mail(:to => @user.email, :subject => "Welcome!")
  end

end
