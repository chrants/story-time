class Rules
  include DataMapper::Resource
  
  property :max_chars,      Integer
  property :min_chars,      Integer
    
  property :max_words,      Integer
  property :min_words,      Integer
    
  property :number_rounds,  Integer
    
  property :story_time_out, Integer
  property :scene_time_out, Integer
    
  belongs_to :story, :key => true
end