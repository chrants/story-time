require 'test_helper'

class Admin::UploadsControllerTest < ActionController::TestCase
  setup do
    @admin_upload = admin_uploads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_uploads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_upload" do
    assert_difference('Admin::Upload.count') do
      post :create, admin_upload: {  }
    end

    assert_redirected_to admin_upload_path(assigns(:admin_upload))
  end

  test "should show admin_upload" do
    get :show, id: @admin_upload
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_upload
    assert_response :success
  end

  test "should update admin_upload" do
    put :update, id: @admin_upload, admin_upload: {  }
    assert_redirected_to admin_upload_path(assigns(:admin_upload))
  end

  test "should destroy admin_upload" do
    assert_difference('Admin::Upload.count', -1) do
      delete :destroy, id: @admin_upload
    end

    assert_redirected_to admin_uploads_path
  end
end
