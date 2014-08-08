require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login" do
    marielo = users(:marielo)
    post :create, username: 'Marielo', password: 'marielo'
    assert_redirected_to pickups_url
    assert_equal marielo.id, session[:user_id]
  end

  test "should fail login" do
    marielo = users(:marielo)
    post :create, username: 'Marielo', password: 'wrong'
    assert_redirected_to login_url
  end

  test "should logout" do
    delete :destroy
    assert_redirected_to login_url
  end
end
