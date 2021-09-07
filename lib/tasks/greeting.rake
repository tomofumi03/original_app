namespace :greeting do
  desc '挨拶するメールを発行する。'
  task say_hello: :environment do
    users = User.all

    users.each do |user|
      UserMailer.remind_payment(user).deliver
    end
  end
end
