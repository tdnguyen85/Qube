require 'test_helper'

class BdcardsControllerTest < ActionController::TestCase
  setup do
    @bdcard = bdcards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bdcards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bdcard" do
    assert_difference('Bdcard.count') do
      post :create, bdcard: { date_created: @bdcard.date_created, description: @bdcard.description, title: @bdcard.title, user_id: @bdcard.user_id }
    end

    assert_redirected_to bdcard_path(assigns(:bdcard))
  end

  test "should show bdcard" do
    get :show, id: @bdcard
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bdcard
    assert_response :success
  end

  test "should update bdcard" do
    put :update, id: @bdcard, bdcard: { date_created: @bdcard.date_created, description: @bdcard.description, title: @bdcard.title, user_id: @bdcard.user_id }
    assert_redirected_to bdcard_path(assigns(:bdcard))
  end

  test "should destroy bdcard" do
    assert_difference('Bdcard.count', -1) do
      delete :destroy, id: @bdcard
    end

    assert_redirected_to bdcards_path
  end
end
