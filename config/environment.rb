# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# Mail configuration
Pickitup::Application.configure do
  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
    address: "smtp.1and1.es",
    port: 587,
    domain: "pickitup.angelcalvo.com",
    authentication: "plain",
    user_name: "admin",
    password: "penY_pencE",
    enable_starttls_auto: true
  }
end
