class StoryController < ApplicationController
  
  before_filter 'check_credentials(:user)',
    only: [:update, :create]
  
  def show
    @story = Story.get params[:id]
    @story_scenes = @story.story_scenes
  end

  def update
    
  end

  def create
    story_hash = params.only('name', 'description')
    rules_hash = params[:rules].only('')

  end

  #POST to create a new scene.
  def story_scene
    scene_hash = params.only('body')
    StoryScene.create(scene_hash)
  end

  def destroy

  end

  private
  def get_story

  end

end