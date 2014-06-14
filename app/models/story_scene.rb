class StoryScene
  include DataMapper::Resource
  property :id,     Serial
  
  property :created_on, Date,
                        lazy: true
  property :created_at, DateTime,
                        lazy: true

  property :body, Text

  belongs_to :user
  belongs_to :story
  
end