class PublicMailer < ActionMailer::Base
  default from: "info@eds.com"

  def contact_email(params)
    @email = params[:email]
    @name = params[:name]
    @message = params[:message]
    mail from: @email, to: 'some_email@eds.com', subject: 'Contact Email'
  end

end
