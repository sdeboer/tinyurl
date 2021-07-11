require "test_helper"

class LinkTest < ActiveSupport::TestCase
  test "must have destination" do
    link = Link.create
    assert_not link.valid?
  end
  
  test "can create link" do
    link = Link.create(destination: "https://ingamer.com/some/where")
    assert link.valid?
  end
  
  test "cannot create an existing link" do
    link = Link.create(destination: "https://ingamer.com/existing")
    assert_not link.valid?
  end
  
  test "gives a shortened version" do
    link = Link.find_by(destination: "https://ingamer.com/existing")
    assert_equal link.short, 20
  end
end
