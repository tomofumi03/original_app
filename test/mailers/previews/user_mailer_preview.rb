# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/remind_payment
  def remind_payment
    user = User.first
    UserMailer.remind_payment(user)
  end

end
