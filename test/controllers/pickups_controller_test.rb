require 'test_helper'

class PickupsControllerTest < ActionController::TestCase
  
  setup do
    @pickup_one = pickups(:one)
    @pickup_one_updated = {
      picked_at_time: Time.now,
      picked_at_date: Time.now,
      comments: "It was on the pavement",
      coin_id: coins(:one_cent).id,
      handed_over: false
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pickups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pickup" do
    assert_difference('Pickup.count') do
      post :create, pickup: @pickup_one_updated
    end

    assert_redirected_to pickups_path, notice: 'Pickup was created.'
  end

  test "should show pickup" do
    get :show, id: @pickup_one
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pickup_one
    assert_response :success
  end

  test "should update pickup" do
    patch :update, id: @pickup_one, pickup: @pickup_one_updated
    assert_redirected_to pickups_path, notice: 'Pickup was updated.'
  end

  test "should destroy pickup" do
    assert_difference('Pickup.count', -1) do
      delete :destroy, id: @pickup_one

    end

    assert_redirected_to pickups_path
  end
end
