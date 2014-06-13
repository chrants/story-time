class MemberMailer < ActionMailer::Base
  #before_action :init_user
  default from: "info@eds.com"

  def notification body
    @notification_body = body
  end

  def beta_invite email

  end

  private
  def init_user
    unless @admin
      @user = User.first(token: session[:user])
      @email_to = @user.email
    end
  end
end
