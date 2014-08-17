require 'test_helper'

class InvitationNotifierTest < ActionMailer::TestCase
  test "invite" do
    marielo = users(:marielo)
    contributor = User.new do |c|
      c.email = "angel@calvo.com"
      c.password_digest = BCrypt::Password.create('psswd')
    end
    mail = InvitationNotifier.invite marielo, contributor
    assert_equal "You've been invited to join Pickitup!", mail.subject
    assert_equal ["angel@calvo.com"], mail.to
    assert_equal ["admin@pickitup.angelcalvo.com"], mail.from
    encoded_pw = URI.encode(contributor.password_digest)
    assert_match /#{Regexp.escape(encoded_pw)}/, mail.body.encoded
  end

end
