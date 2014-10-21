require 'test_helper'

class VisitHistoriesControllerTest < ActionController::TestCase
  setup do
    @visit_history = visit_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:visit_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create visit_history" do
    assert_difference('VisitHistory.count') do
      post :create, visit_history: { memo: @visit_history.memo, next_visit_at: @visit_history.next_visit_at, visited_at: @visit_history.visited_at, visited_user_id: @visit_history.visited_user_id }
    end

    assert_redirected_to visit_history_path(assigns(:visit_history))
  end

  test "should show visit_history" do
    get :show, id: @visit_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @visit_history
    assert_response :success
  end

  test "should update visit_history" do
    patch :update, id: @visit_history, visit_history: { memo: @visit_history.memo, next_visit_at: @visit_history.next_visit_at, visited_at: @visit_history.visited_at, visited_user_id: @visit_history.visited_user_id }
    assert_redirected_to visit_history_path(assigns(:visit_history))
  end

  test "should destroy visit_history" do
    assert_difference('VisitHistory.count', -1) do
      delete :destroy, id: @visit_history
    end

    assert_redirected_to visit_histories_path
  end
end
