require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get dashboard" do
    get :dashboard
    assert_response :success
  end

  test "should get wetter_config" do
    get :wetter_config
    assert_response :success
  end

end
