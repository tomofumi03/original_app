class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.remind_payment.subject
  #
  def remind_payment(user)
    @user = user
    mail to: user.email, subject: "Remind payment"
  end
end
