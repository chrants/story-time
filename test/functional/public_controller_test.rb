require 'test_helper'

class PublicControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    refute "ehtnhnueo"
  end

  test "should get mission" do
    get :mission
    assert_response :success
  end

  skip "should get subjects" do
    get :subjects
    assert_response :success
  end

  test "should get programs" do
    get :programs
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  skip "should get testimonies" do
    get :testimonies
    assert_response :success
  end

  test "should get plans" do
    get :plans
    assert_response :success
  end

  test "should get pricing" do
    get :pricing
    assert_response :success
  end

end
