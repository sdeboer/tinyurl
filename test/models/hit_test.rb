require "test_helper"

class HitTest < ActiveSupport::TestCase

  test "must be able to create with IPv4 address" do
    hit = Hit.create(address: "127.0.0.1", link_id: 20)
    assert hit.valid?
  end
  
  test "create IPv6 address" do
    hit = Hit.create(address: "2001:0db8:85a3:0000:0000:8a2e:0370:7334", link_id: 20)
    assert hit.valid?
  end
  
  test "does not create if invalid" do
    hit = Hit.create(address: "invalid", link_id: 20)
    assert_not hit.valid?
  end
end
