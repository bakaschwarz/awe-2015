require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  def setup
    @project = projects(:superproject)
  end

  test "repo can be blank or is valid url" do
    @project.name = "    "
    assert @project.valid?
    @project.name = "http://example.com/harald/myrepo"
    assert @project.valid?
  end

  test "repo should not have invalid address" do
    invalid_names = %w[bloat@windows.& 1234.de./ log._ htttp://hallo.org
                        spiegel.12]
    invalid_names.each do |name|
        @project.repo = name
        assert_not @project.valid?
    end
  end
end
