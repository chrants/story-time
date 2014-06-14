class GroupController < ApplicationController
  
  before_filter 'check_credentials(:user)',
    only: [:update, :create]
  
  def show
    @group_stories = @group.stories
  end

  def update
    
  end

  def new

  end

  def create
    group_hash = params.only('name', 'description')
    g = Group.create(group_hash) 

    g.users << @users
    p.save!
  end

  def destroy
    
  end

  private
  def get_group
    @group = Group.get params[:id]
  end

end