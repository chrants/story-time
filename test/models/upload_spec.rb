require 'test_helper'
 
class UploadTest < ActiveSupport::TestCase
  
  # called before every single test
  def setup
    #@post = posts(:one)
  end
 
  # called after every single test
  def teardown
    # as we are re-initializing @post before every test
    # setting it to nil here is not essential but I hope
    # you understand how you can use the teardown method
    @post = nil
  end
  
  # test "the truth" do
  #   assert true
  # end
  
  private
  def initialize_upload
    @upload = Upload.random
  end
  
end