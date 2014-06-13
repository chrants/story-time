require 'spec_helper'

describe UploadsController do
	begin
    context "as a member" do
      before :all do
        @to_destroy = Upload.create!( 
          filename: "#{rand_word}.doc",
          path: "#{rand_word}/#{rand_word}",
          token: rand_token,
          title: rand_word,
          description: rand_word,
          member: rand_instance(Member)
        )
        raise "cannot create upload" unless @to_destroy.save
      end

      after :all do
        @to_destroy.destroy!
      end

    	before :each do 
    		@user = rand_instance Member
    		session[:user] = @user.token
    		@upload = rand_instance Upload
        expect(@upload).not_to be_nil
        expect(@upload.id).not_to raise_error
    	end

    	include_examples "request", 
    		req_type: "GET", 
    		page: :show,
    		desc: "Show an upload page",
    		params: {id: @upload.id},
    		session: {user: session[:user]}

=begin
    	include_examples "request", 
    		req_type: "GET", 
    		page: :home,
    		desc: "Admin Home Page and Dashboard",
    		params: {id: @upload.id},
    		session: {user: session[:user]}

    	include_examples "request", 
    		req_type: "GET", 
    		page: :home,
    		desc: "Admin Home Page and Dashboard",
    		params: {id: @upload.id},
    		session: {user: session[:user]}

    	include_examples "request", 
    		req_type: "GET", 
    		page: :home,
    		desc: "Admin Home Page and Dashboard",
    		params: {id: @upload.id},
    		session: {user: session[:user]}

    	include_examples "request", 
    		req_type: "GET", 
    		page: :home,
    		desc: "Admin Home Page and Dashboard",
    		params: {id: @upload.id},
    		session: {user: session[:user]}

    	include_examples "request", 
    		req_type: "GET", 
    		page: :home,
    		desc: "Admin Home Page and Dashboard",
    		params: {id: @upload.id},
    		session: {user: session[:user]}

=end
    end

    context "as a user" do
      before :each do 
        @user = rand_instance Member
        session[:user] = @user.token
        @upload = rand_instance Upload
      end

      include_examples "request", 
        req_type: "GET", 
        page: :show,
        desc: "Show an upload page",
        params: {id: @upload.id},
        session: {user: session[:user]}

=begin
      include_examples "request", 
        req_type: "GET", 
        page: :home,
        desc: "Admin Home Page and Dashboard",
        params: {id: @upload.id},
        session: {user: session[:user]}

      include_examples "request", 
        req_type: "GET", 
        page: :home,
        desc: "Admin Home Page and Dashboard",
        params: {id: @upload.id},
        session: {user: session[:user]}

      include_examples "request", 
        req_type: "GET", 
        page: :home,
        desc: "Admin Home Page and Dashboard",
        params: {id: @upload.id},
        session: {user: session[:user]}

      include_examples "request", 
        req_type: "GET", 
        page: :home,
        desc: "Admin Home Page and Dashboard",
        params: {id: @upload.id},
        session: {user: session[:user]}

      include_examples "request", 
        req_type: "GET", 
        page: :home,
        desc: "Admin Home Page and Dashboard",
        params: {id: @upload.id},
        session: {user: session[:user]}
=end

      pending "As a user redirect checks."
    end
  rescue Exception => e
    pending "Uploads not working."
  end
end
