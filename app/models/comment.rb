class Comment
    include DataMapper::Resource
    property :id,           Serial
    property :title,        String,
                            length: 1..75
    property :contents,     String,
                            length: 4..250
    property :type,         Discriminator

    property :created_on,   Date
    property :created_at,   DateTime
    property :updated_on,   Date
    property :updated_at,   DateTime

    belongs_to :user

    #has n, :ratings, 'CommentRating'
    has n, :flags, 'CommentFlag'
end

class PostComment < Comment
    belongs_to :post
end