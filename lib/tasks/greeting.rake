namespace :greeting do
  desc '支払いを思い出させる'
  task remind_payment: :environment do
    users = User.all

    users.each do |user|
      UserMailer.remind_payment(user).deliver
    end
  end
end
