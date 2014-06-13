class Rating
    include DataMapper::Resource
    property    :id,            Serial,
                                required: true
    property    :value,         Float,
                                required: true
    property    :type,          Discriminator

    property    :created_on,    Date
    property    :created_at,    DateTime
    property    :updated_on,    Date
    property    :updated_at,    DateTime

    belongs_to  :user,          required: true
end

class UploadRating < Rating
    belongs_to  :upload,        required: false
end

=begin
class CommentRating < Rating
    belongs_to  :comment,       required: true
end
=end

#class UserRating < Rating; has 1, :user; end

class PostRating < Rating
    belongs_to  :post,          required: false
end

class Testimony < Rating
    property    :title,         String,
                                length: 3..50,
                                messages: {

                                }
    property    :contents,      String,
                                length: 4..1000,
                                messages: {

                                }
end