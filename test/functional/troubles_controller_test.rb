require 'test_helper'

class TroublesControllerTest < ActionController::TestCase
  setup do
    @trouble = troubles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:troubles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trouble" do
    assert_difference('Trouble.count') do
      post :create, trouble: { category: @trouble.category, client_id: @trouble.client_id, severity: @trouble.severity, state: @trouble.state, text: @trouble.text, title: @trouble.title, user_id: @trouble.user_id }
    end

    assert_redirected_to trouble_path(assigns(:trouble))
  end

  test "should show trouble" do
    get :show, id: @trouble
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trouble
    assert_response :success
  end

  test "should update trouble" do
    put :update, id: @trouble, trouble: { category: @trouble.category, client_id: @trouble.client_id, severity: @trouble.severity, state: @trouble.state, text: @trouble.text, title: @trouble.title, user_id: @trouble.user_id }
    assert_redirected_to trouble_path(assigns(:trouble))
  end

  test "should destroy trouble" do
    assert_difference('Trouble.count', -1) do
      delete :destroy, id: @trouble
    end

    assert_redirected_to troubles_path
  end
end
