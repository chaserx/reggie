module RegistrationsHelper
  
  def number_of_attendees
    return Registration.count
  end
  
  def number_of_attendees_for_lunch
    return Registration.find(:all, :conditions => "lunch = '1'").size
  end
  
  def number_of_attendees_for_dinner
    total = 0
    registrations = Registration.find(:all)
    registrations.each{|e| total += e.partysize}
    return total
  end
  
  def number_of_abstracts
    total = 0
    return Registration.find_by_sql('SELECT * FROM registrations WHERE abstract_file_name NOT LIKE ""').size
  end
  
  def dollars_pledged
    total = 0
    return Registration.sum('fees')
  end
  
  def hasFees(reg)
    if reg.fees > 0
      return "#{number_to_currency(reg.fees)},"
    else "No Fees,"
    end
    rescue "Unknown Fees,"
  end

  def hasEveningSession(reg)
    if reg.eveningsession == 1
      return "Evening Session,"
    else "No Evening Session,"
    end 
    rescue "Unknown Evening Session,"
  end
  
  def hasLunch(reg)
    if reg.lunch == 1
      return "Lunch"  
    else "No Lunch"
    end
    rescue "Unknown Lunch"
  end
  
  def singleOrCompany(reg)
    if reg.eveningsession == 1
      case
        when reg.partysize == 1
          return "Single for"
        when reg.partysize > 1
          return "Party of #{reg.partysize} for"
      end
    end
    rescue "Unknown Party Size for"
  end
  
  def going_esession?(arr)
    if arr.eveningsession == 0
      render :inline => "No"
    elsif arr.eveningsession == 1
      render :inline => "Yes"
    else
      render :inline => "?"
    end
  end
  
  def going_lunch?(arr)
    if arr.lunch == 0
      render :inline => "No"
    elsif arr.lunch == 1
      render :inline => "Yes"
    else
      render :inline => "?"
    end
  end
  
  def latest_attendee
      @registration = Registration.find(:last, :order => 'created_at ASC')
      unless @registration.nil?
        return "#{@registration.firstname} #{@registration.lastname} - #{time_ago_in_words(@registration.created_at)} ago"
      end
  end
  
  def format_phone(reg)
    ph = reg
    if ph.size == 10
      return "(#{ph[0..2]}) #{ph[3..5]} - #{ph[6..9]}"
    elsif ph.size == 5
      return "#{ph.first}-#{ph[1..4]}"
    elsif ph.size == 7
      return "#{ph[0..2]} - #{ph[3..6]}"
    else
      return ph
    end
    
  end
  
  #for show action
  def prettyNameFormat
    return @registration.title + " " + @registration.firstname + " " + @registration.lastname
  end
  
  def getAbstract(arg)
    if arg.abstract_file_name.nil?
  		return "No Abstract"
  	else
  		return link_to("#{arg.abstract.original_filename}", arg.abstract.url) 
  	end
	rescue "abstract error"
  end
  
  def format_name(reg)
    return reg.title + " " + reg.firstname + " " + reg.lastname
  end
  
  def is_reg_open?
    if Settings.allow_registrations
      render :partial => 'open'
    else
      render :partial => 'closed'
    end
  end
  
end
