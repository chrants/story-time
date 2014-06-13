class Topic
	include DataMapper::Resource
	property :id,   Serial
	property :name, String

	property :created_on, Date,
	                      lazy: true
	property :created_at, DateTime,
	                      lazy: true
	property :updated_on, Date
	property :updated_at, DateTime

	has n, :subjects, through: Resource
	has n, :uploads,  through: Resource
end