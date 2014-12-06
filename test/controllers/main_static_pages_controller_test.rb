require 'test_helper'

class MainStaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get recipe" do
    get :recipe
    assert_response :success
  end

  test "should get resources" do
    get :resources
    assert_response :success
  end

end
