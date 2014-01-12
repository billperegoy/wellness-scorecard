require 'test_helper'

class TwitterControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get get_api_data" do
    get :get_api_data
    assert_response :success
  end

end
