class RegistrationsController < ApplicationController
  
  
  def index
    @registrations = Registration.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @registrations }
      format.csv {
            registrations = Registration.find(:all, :order => "lastname ASC")
            csv = FasterCSV.generate do |csv|
              csv << ["Name", "Dept.", "Org.", "Address1", "Address2", "City", "State", "Zip", "Phone", "email", "Lunch", "EveningSession", "Partysize", "Fees", "BusinessOfficer", "BizOfficerEmail", "BizOfficerPhone", "Date Registered"]
              registrations.each do |registration|
                csv << [[registration.title, registration.firstname, registration.lastname].join(" ").strip, registration.dept, registration.organization, registration.address1, registration.address2, registration.city, registration.state, registration.zip, registration.phone, registration.email, registration.lunch, registration.eveningsession, registration.partysize, registration.fees, registration.bizperson, registration.bizpersonemail, registration.bizpersonphone, registration.created_at ]
              end
            end
            t = Time.now
            send_data(csv, :filename => "Registrations#{t.strftime("%m_%d_%Y")}.csv", 
                      :type => 'text/csv', :disposition => 'attachment')
      }
    #respond_to end
    end
  # def index end  
  end
  
  def show
    @registration = Registration.find(params[:id])
  end
  
  def new
    @registration = Registration.new
  end
  
  def create
    @registration = Registration.new(params[:registration])
    #if verify_recaptcha(:private_key => PASSWORDS_CONFIG[:recaptcha_private_key]) and @registration.save
    if @registration.save
      flash[:notice] = "Successfully created registration."
      redirect_to @registration
    else
      render :action => 'new'
    end
  end
  
  def edit
    @registration = Registration.find(params[:id])
  end
  
  def update
    @registration = Registration.find(params[:id])
    if @registration.update_attributes(params[:registration])
      flash[:notice] = "Successfully updated registration."
      redirect_to @registration
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @registration = Registration.find(params[:id])
    @registration.abstract.clear
    @registration.destroy
    flash[:notice] = "Successfully destroyed registration."
    redirect_to registrations_url
  end
  
end
