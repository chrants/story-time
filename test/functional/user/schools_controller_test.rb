require 'test_helper'

class User::SchoolsControllerTest < ActionController::TestCase
  setup do
    @user_school = user_schools(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_schools)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_school" do
    assert_difference('User::School.count') do
      post :create, user_school: {  }
    end

    assert_redirected_to user_school_path(assigns(:user_school))
  end

  test "should show user_school" do
    get :show, id: @user_school
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_school
    assert_response :success
  end

  test "should update user_school" do
    put :update, id: @user_school, user_school: {  }
    assert_redirected_to user_school_path(assigns(:user_school))
  end

  test "should destroy user_school" do
    assert_difference('User::School.count', -1) do
      delete :destroy, id: @user_school
    end

    assert_redirected_to user_schools_path
  end
end
