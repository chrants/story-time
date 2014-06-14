class GroupController < ApplicationController
  
  before_filter 'check_credentials(:user)',
    only: [:update, :create]
  
  def show
    
  end

  def update
    
  end

  def create
    
  end

  def destroy
    @user.destroy if @admin
  end

end