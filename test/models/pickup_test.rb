require 'test_helper'

class PickupTest < ActiveSupport::TestCase
  test "location complete" do
    pickup = pickups(:one)
    pickup.latitude = -34.3423423
    assert pickup.invalid?
  end
end
