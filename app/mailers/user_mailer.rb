class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.mailer.subject
  # def mailer
  #   @greeting = "Hi"
  #
  #   mail to: "to@example.org"
  # end
  def send_temp_password_to_admin(email, password)
    @email = email
    @password = password
    mail(to: email)
  end

  def send_welcome_email(user)
    @user = user
    mail(:to => @user.email, :subject => "Welcome!")
  end
end
