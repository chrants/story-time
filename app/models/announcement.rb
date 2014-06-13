class Announcement
	include DataMapper::Resource
	property :id,			Serial

	property :name, 		String
	property :content, 		Text

    property :created_on,   Date
    property :created_at,   DateTime
    property :updated_on,   Date
    property :updated_at,   DateTime
end