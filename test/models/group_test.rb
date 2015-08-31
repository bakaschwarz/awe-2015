require 'test_helper'

class GroupTest < ActiveSupport::TestCase

  def setup
    @group = groups(:alpha)
  end

  test "name should not be blank" do
    @group.name = "    "
    assert_not @group.valid?
  end
end
