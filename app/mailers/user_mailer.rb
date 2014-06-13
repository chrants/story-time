class UserMailer < ActionMailer::Base
  before_filter :init_user, only: [:advertise]
  default from: "info@eds.com"

  def welcome_email user
    @user = user
    @email_to = @user.emails[0].name
  	mail to: @email_to, subject: 'Welcome to Story Time!'
  end

  def advertise session
    mail to: @email_to, subject: 'EDS Ad Title'
  end

  private
  def init_user
  	@user = User.first(token: session[:user])
  	@email_to = @user.emails[0].name
  end
end
