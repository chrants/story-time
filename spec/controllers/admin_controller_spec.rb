require 'spec_helper'

describe AdminController do
  before :all do
    email = Email.new(name: "anemail@gmail.com")
    user_hash = {
      password: "I am a password",
      created:  true,
      name:     "The admin",
      token:    rand_token,
      type:     Admin
    }
    user = User.new(user_hash)
    user.emails << email
    user.save!
  end

  before :each do
    @admin = Admin.first
    @token = @admin.token if @admin
  end

	include_examples "request", 
		req_type: "GET", 
		page: :home,
		desc: "Admin Home Page and Dashboard",
    session: { token: @token }

	include_examples "request", 
		req_type: "GET", 
		page: :feed,
		desc: "Admin feed for looking at incoming uploads and members.",
    session: { token: @token }

	include_examples "request", 
		req_type: "GET", 
		page: :flags,
		desc: "View a feed specifically of flagged content.",
    session: { token: @token }

	include_examples "request", 
		req_type: "GET", 
		page: :uploads,
		desc: "View all uploads as admin.",
    session: { token: @token }

	include_examples "request", 
		req_type: "GET", 
		page: :pending_uploads,
		desc: "View uploads that have not yet been reviewed.",
    session: { token: @token }

end
