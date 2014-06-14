class User
	#PLANS = ['user', 'subscriber', 'developer']

	include DataMapper::Resource
	property :id,		  	Serial,
							required: true
	property :name, 	  	String,
						  	length: 2..45,
						  	required: true,
							messages: {
						  		presence: 	"WARNING: No name specified for #{self.to_s}!",
						  		length: 	"WARNING: Invalid length of name specified #{self.to_s}",
						  	}

	has n,  :emails

	property :password,   	BCryptHash,
							length: 10..300,
						  	required: true,
						  	lazy: true,
						  	messages: {
						  		presence: 	"WARNING: Attempt @ #{self.to_s} NO PASSWORD.",
						  		length: 	"WARNING: Invalid length on password. #{self.to_s}"
						  	}
	property :token, 	  	String,
							length: 36..100,
						  	required: true,
						  	unique: true,
						  	unique_index: true,
						  	lazy: true,
						  	messages: {
						  		presence: 	"WARNING: Token Nonexistant! #{self.to_s}",
						  		length: 	"WARNING: Token length out of range 36..100  #{self.to_s}",
						  		is_unique: 	"WARNING: Token is not a unique value! #{self.to_s}"
						  	}

	property :type, 	  	Discriminator

	property :zip_code,		String,
							length: 4..15,
							lazy: true
	property :city,		  	String,
							length: 0..50,
							required: false,
							lazy: true
	property :state,      	String,
							length: 2..3,
							required: false,
							lazy: true


	property :created_on, 	Date,
	                        lazy: true
	property :created_at, 	DateTime,
	                        lazy: true
	property :updated_on, 	Date
	property :updated_at, 	DateTime

	property :created,	  	Boolean,
						  	default: false
	property :confirmed,  	Boolean,
						  	default: false

  property :recieving_emails, Boolean,
                default: true

  property :display_email_publicly, Boolean,
                default: true


	has n, :ratings
	has n, :comments
	has n, :flags

  property :linkedin_token, String,
              :required => false

	#has 1, :thumbnail,		'UserThumbnail'

  has n, :groups, through: Resource
  has n, :story_scenes

	validates_with_method :emails, :has_email?

	after :create do |this|
		this.created = true
		this.save
	end

	def has_email?
	  !!(self.emails[0]) || ['false', "An email has not been specified"]
  end

end
