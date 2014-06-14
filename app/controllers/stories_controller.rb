class StoriesController < ApplicationController
  
  before_filter 'check_credentials(:user)',
    only: [:update, :create]
  
  before_filter 'get_story'
  
  before_filter 'get_group'
  
  def show
    @story_scenes = @story.story_scenes
    @rules = @story.rules
  end

  def new

  end

  def update
    
  end

  def create
    story_hash = params.only('name', 'description')
    rules_hash = params[:rules].only(
      'min_chars', 'max_chars')

    story = Story.create(story_hash)
    story.group = Group.find params[:group_id]
    story.rules = Rules.new(rules_hash)
    story.save!
    
    redirect_to "/groups/#{params[:group_id]}/stories/#{ story.id }"
  end

  #POST to create a new scene.
  def story_scene
    scene_hash = params.only('body')
    
    scene = StoryScene.new(scene_hash)
    scene.user = @user
    body = scene.body

    rules = @story.rules

    unless body.length < rules.min_chars and body.length > rules.max_chars 
      body.words.size < rules.min_words and body.words.size > rules.max_words

      @story.story_scenes << scene
      assert @story.save!
      
      redirect_to "/groups/#{ @group.id }/stories/#{ @story.id }"
    else
      flash[:alert] = {}
    end
  end

  def destroy
    @story.destroy!
  end

  private
  def get_story
    @story = Story.get params[:id] || params[:story_id]
  end
  
  def get_group
    @group = Group.get params[:group_id]
  end

end