require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  setup do
    @user = users(:polypiel)
    @update = {
      username: 'foo',
      email: 'foo@pickup.com'
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: {email: 'not@inthedb.com'}
    end

    assert_redirected_to users_path
  end

  test "should not create user" do
    assert_no_difference('User.count') do
      post :create, user: {email: 'polypiel@pickitup.com'}
    end

    assert_response :success
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: @update
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end

  test "should not get signup" do
    logout
    get :signup_new
    assert_redirected_to :login
  end

  test "should get signup" do
    logout
    invited = users(:invited)
    get :signup_new, u: invited.email, p: URI.encode(invited.password_digest)
    assert_response :success
  end

  test "should signup" do
    logout
    invited = users(:invited)
    patch :signup, username: 'john', email: 'invited@gmail.com', password: '123456' 
    assert_redirected_to :login
  end
end
