class Post
	include DataMapper::Resource
	property :id, 		Serial
	property :title, 	String
	property :contents, Text
	property :type, 	Discriminator

	has n, :ratings,	'PostRating'
	has n, :comments, 	'PostComment'
	belongs_to :admin
end

=begin
class UploadPost < Post
	property :thumbnail, String
end
=end