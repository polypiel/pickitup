require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "active user has username" do
    marielo = users(:marielo)
    marielo.username = nil
    assert marielo.invalid?
  end
end
