class School
    include DataMapper::Resource
    property :id,           Serial
    property :name,         String
    property :city,         String
    property :state,        String, 
                            length: 2
    property :district,     String
    property :country,      String, 
                            default: "United States"

    property :created_on,   Date,
                            lazy: true
    property :created_at,   DateTime,
                            lazy: true
    property :updated_on,   Date
    property :updated_at,   DateTime

    has n,   :users, through: Resource
end
