class Story
  include DataMapper::Resource
  property :id,     Serial
    
  property :name,   String
    
  property :created_on, Date,
                        lazy: true
  property :created_at, DateTime,
                        lazy: true
  property :updated_on, Date
  property :updated_at, DateTime

  property :description, Text

  has 1, :rules

  has n, :story_scenes

  belongs_to :group

end
