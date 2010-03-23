class AdminController < ApplicationController
  
  before_filter :require_user
  
  def toggle_registration_availability
    case Settings.allow_registrations
    when false
      Settings.allow_registrations = true
    when true
      Settings.allow_registrations = false
    end
    respond_to do |format|
      format.js
    end
  end
  
end
