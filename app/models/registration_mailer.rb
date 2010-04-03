class RegistrationMailer < ActionMailer::Base
  def welcome_email(registrant)
    recipients registrant.email
    from "RegistrationApp Mailer <donotreply@registrationapp.com>"
    subject "Thank you for your registration."
    sent_on Time.now 
    body :registration => registrant
    content_type "text/plain"
  end

end
