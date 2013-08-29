# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Screenprintly::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SENDGRID_USER'],
  :password => ENV['SENDGRID_PASS'],
  :domain => 'screenPrintly.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}