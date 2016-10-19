class ApplicationMailer < ActionMailer::Base
  # Our return address
  default from: 'info@stoats.co.uk'
  layout 'mailer'
end
