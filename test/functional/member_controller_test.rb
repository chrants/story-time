require 'test_helper'

class MemberControllerTest < ActionController::TestCase
  test "should get upload" do
    get :upload
    assert_response :success
  end

  test "should get download" do
    get :download
    assert_response :success
  end

  test "should get browse" do
    get :browse
    assert_response :success
  end

  test "should get feed" do
    get :feed
    assert_response :success
  end

  test "should get comments" do
    get :comments
    assert_response :success
  end

end
