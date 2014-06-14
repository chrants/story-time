class StoryController < ApplicationController
  
  before_filter 'check_credentials(:user)',
    only: [:update]
  
  before_filter 'check_credentials(:admin)',
    only: [:destroy]  


  def show
    @_user = User.get(params[:id])
  end

  def update
    if params[:id] == @user.id.to_s or @admin
      putsy params
      
      params[:display_email_publicly] = (params[:display_email_publicly] ? true : false)
      params[:recieving_emails] = (params[:recieving_emails] ? true : false)

      Rails.logger.debug @user.update params.only('recieving_emails', 'display_email_publicly')
    else 

    end

    redirect_to "/user/profile"
  end

  def destroy
    @user.destroy if @admin
  end

end