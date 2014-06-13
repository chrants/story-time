require 'spec_helper'

describe MemberController do
	include_examples "request", 
		req_type: "GET", 
		page: :home,
		desc: "Member Home Page"

=begin
	include_examples "request", 
		req_type: "GET", 
		page: :download,
		desc: "Download an upload"
=end

=begin
	include_examples "request", 
		req_type: "GET", 
		page: :browse,
		desc: "Home Page"
=end

	include_examples "request", 
		req_type: "GET", 
		page: :feed,
		desc: "Feed; not currently used"

end
