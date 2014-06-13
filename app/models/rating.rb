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

=begin
class CommentRating < Rating
    belongs_to  :comment,       required: true
end
=end

#class UserRating < Rating; has 1, :user; end

class PostRating < Rating
    belongs_to  :post,          required: false
end
