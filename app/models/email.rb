class Email
  include DataMapper::Resource
  property :name,     	String,
                      	format: :email_address,
                      	key: true,
                      	unique_index: true,
					  	length: 9..60

  property :confirmed, 	Boolean,
  						default: false

  belongs_to :user
end