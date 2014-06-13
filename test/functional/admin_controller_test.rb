require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get feed" do
    get :feed
    assert_response :success
  end

  test "should get flags" do
    get :flags
    assert_response :success
  end

  test "should get uploads" do
    get :uploads
    assert_response :success
  end

end
