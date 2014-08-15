class InvitationNotifier < ActionMailer::Base
  default from: "Pickitup! <admin@pickitup.angelcalvo.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invitation_notifier.invite.subject
  #
  def invite(owner, contributor)
    @owner = owner
    @link  = "http://pickitup.angelcalvo.com/signup?u=#{URI.encode(contributor.email)}&p=#{URI.encode(contributor.password_digest)}"

    mail to: contributor.email, subject: "You've been invited to join Pickitup!"
  end
end
