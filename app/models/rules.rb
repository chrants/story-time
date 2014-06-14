class Rules
  include DataMapper::Resource
  
  belongs_to :story, :key => true
end