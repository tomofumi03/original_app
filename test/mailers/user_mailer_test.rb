require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "remind_payment" do
    mail = UserMailer.remind_payment
    assert_equal "Remind payment", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
