require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get dashboard" do
    get :dashboard
    assert_response :success
  end

  test "should get config" do
    get :config
    assert_response :success
  end

end
