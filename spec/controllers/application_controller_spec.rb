require 'spec_helper'

describe ApplicationController do
	it 'should not know what ActiveRecord is.' do
		expect(proc { ApplicationController::ActiveRecord }).to raise_error
	end
end
