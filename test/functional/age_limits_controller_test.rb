require 'test_helper'

class AgeLimitsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:age_limits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create age_limit" do
    assert_difference('AgeLimit.count') do
      post :create, :age_limit => { }
    end

    assert_redirected_to age_limit_path(assigns(:age_limit))
  end

  test "should show age_limit" do
    get :show, :id => age_limits(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => age_limits(:one).to_param
    assert_response :success
  end

  test "should update age_limit" do
    put :update, :id => age_limits(:one).to_param, :age_limit => { }
    assert_redirected_to age_limit_path(assigns(:age_limit))
  end

  test "should destroy age_limit" do
    assert_difference('AgeLimit.count', -1) do
      delete :destroy, :id => age_limits(:one).to_param
    end

    assert_redirected_to age_limits_path
  end
end
