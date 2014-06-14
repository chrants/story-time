class StoryController < ApplicationController
  
  before_filter 'check_credentials(:user)',
    only: [:update]
  
  def show
    @story = Story.get params[:id]
    @story_scenes = StoryScene.all
  end

  def update
    @story
  end

  def create
    
  end

  #POST to create a new scene.
  def story_scene
    StoryScene
  end

  def destroy
    @user.destroy if @admin
  end

  private
  def get_story

  end

end