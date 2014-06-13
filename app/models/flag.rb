class Flag
	include DataMapper::Resource
	property :id,			Serial
	property :created_on, 	Date
	property :created_at, 	Date
	belongs_to :user
end

class UploadFlag < Flag
	belongs_to :upload
end

class CommentFlag < Flag
	belongs_to :comment
end

class UserFlag < Flag; end