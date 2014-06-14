class StoryController < ApplicationController
  
  before_filter 'check_credentials(:user)',
    only: [:update, :create]
  
  def show
    @story_scenes = @story.story_scenes
  end

  def new

  end

  def update
    
  end

  def create
    story_hash = params.only('name', 'description')
    rules_hash = params[:rules].only(
      'min_chars',      'max_chars', 
      'min_words',      'max_words',
      'story_time_out', 'scene_time_out'
    )

    story = Story.create(story_hash)
    story.rules = Rules.new(rules_hash)
    story.save!

  end

  #POST to create a new scene.
  def story_scene
    scene_hash = params.only('body')
    
    scene = StoryScene.new(scene_hash)

    body = scene.body

    rules = @story.rules

    unless body.length < rules.min_chars and body.length > rules.max_chars 
      body.words.size < rules.min_words and body.words.size > rules.max_words

      @story.story_scenes << scene
      @story.save!
    else
      flash[:alert] = {}
    end
  end

  def destroy
    @story.destroy!
  end

  private
  def get_story
    @story = Story.get params[:id]
  end

end