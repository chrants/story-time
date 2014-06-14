class Rules
  include DataMapper::Resource
  
  property :max_chars,      Integer, default: 500
  property :min_chars,      Integer, default: 140
    
  property :max_words,      Integer, default: 100
  property :min_words,      Integer, default: 25
    
  property :number_rounds,  Integer, default: 5
    
  property :story_time_out, Integer
  property :scene_time_out, Integer
    
  belongs_to :story, :key => true
end