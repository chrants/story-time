class Download
	include DataMapper::Resource
	property :id, Serial
	property :created_on, 	Date,
						  	lazy: true
	property :created_at, 	DateTime,
						  	lazy: true
	property :updated_on, 	Date,
							lazy: true
	property :updated_at, 	DateTime,
							lazy: true

	belongs_to :upload
	belongs_to :member
end