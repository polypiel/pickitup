# Preview all emails at http://localhost:3000/rails/mailers/invitation_notifier
class InvitationNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/invitation_notifier/invite
  def invite
    InvitationNotifier.invite
  end

end
