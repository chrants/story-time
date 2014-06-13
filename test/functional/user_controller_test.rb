require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get signup" do
    get :signup
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get view_subjects" do
    get :view_subjects
    assert_response :success
  end

  test "should get view_topics" do
    get :view_topics
    assert_response :success
  end

  test "should get download_preview" do
    get :download_preview
    assert_response :success
  end

end
