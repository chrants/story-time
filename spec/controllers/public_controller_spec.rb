require 'spec_helper'

describe PublicController do
	include_examples "request", 
		req_type: "GET", 
		page: :index, 
		desc: "Home Page"

	include_examples "request", 
		req_type: "GET", 
		page: :mission,
		desc: "Mission page."

	include_examples "request", 
		req_type: "GET", 
		page: :about,
		desc: "About page."

	include_examples "request", 
		req_type: "GET", 
		page: :contact,
		desc: "Contact page [with optional user logged in => email]."
	include_examples "request", 
		req_type: "POST", 
		page: :contact,
		desc: "Contact page [with params => :email, :title, :body].",
		params: { email: rand_email, title: rand_token, body: rand_word * 30 }

	include_examples "request", 
		req_type: "GET", 
		page: :plans,
		desc: "Gives a description of all of the various plans, costs, etc."

	include_examples "request", 
		req_type: "GET", 
		page: :terms,
		desc: "Terms and Conditions"
end
