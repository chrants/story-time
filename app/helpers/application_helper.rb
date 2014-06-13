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

  def upload_path
    "/upload"
  end

  def uploads_path u=nil
    if u
      "/uploads/#{u.id}"
    else
      "/uploads"
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
    if u
      "/#{u.type == BetaMember ? 'member' : u.type.to_s.downcase}/home"
    elsif @user
      "/#{@user.type == BetaMember ? 'member' : @user.type.to_s.downcase}/home"
    else
      "/"
    end
  end

  def host
    if Rails.env.development? or Rails.env.test?
      "https://localhost:3000"
    else
      "https://educationaldesignstudios.com"
    end
  end

  def thumbnail_for upload=@upload, options={}
    if upload
      upload.put_extension if upload.extension == "extension"
      case upload.extension
      when "doc", "docx", "docm", "dotx", "dot", "odt", "wps"
        image_tag "word.png", options
      when "ppt", "pptx", "pptm" 
        image_tag "powerpoint.png", options
      when "xls", "xlsx", "xlsm", "xlt", "xltx", "xltm", "xlm"
        image_tag "excel.png", options
      else

      end
    end
  end
end
