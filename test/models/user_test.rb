require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:user)
    @group = groups(:alpha)
  end

  test "should be valid" do
    @user.valid?
  end

  test "first name should not be blank" do
    @user.first_name = "     "
    assert_not @user.valid?
  end

  test "last name should not be blank" do
    @user.last_name = "     "
    assert_not @user.valid?
  end
end
