class RegistrationObserver < ActiveRecord::Observer
  def after_create(registrant)  
    RegistrationMailer.deliver_welcome_email(registrant)
  end
end