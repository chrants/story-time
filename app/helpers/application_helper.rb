module ApplicationHelper
  def alert_snippet
    if @alert
      raw "<div class=\"alert alert-#{@alert[:class]}\">#{@alert[:message]}</div>"
    end
  end

  def now
  	time_of Time.now
  end

  def time_of datetime
    todo "Replace with something more logical."
    unless datetime
      return "Never"
    end

    datetime = datetime.to_time if datetime.respond_to? :to_time

  	format = "%A %B %e %Y at %l:%M %P"
  	if(Time.now.strftime(format) == datetime.strftime(format))
  		"Just Now"
  	elsif(Time.now.strftime("%A %B %e %l %P %Y") == datetime.strftime("%A %B %e %l %P %Y"))
		  "#{(Time.now.to_i - datetime.to_i)/60} minutes ago"
	  elsif(Time.now.strftime("%A %B %e %P %Y") == datetime.strftime("%A %B %e %P %Y"))
		  "Today at " << datetime.strftime("%l:%M %P")
  	else
  		datetime.strftime format
  	end
  end

  def user_path
    
  end

  def users_path u=nil
    if u
      "/users/#{u.id}"
    else
      "/users"
    end
  end

  def home_url u=nil
    "/user/home" if @user
    "/"
  end

  def host
  end

end
