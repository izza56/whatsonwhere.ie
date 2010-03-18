require 'test_helper'

class EventInstancesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_instance" do
    assert_difference('EventInstance.count') do
      post :create, :event_instance => { }
    end

    assert_redirected_to event_instance_path(assigns(:event_instance))
  end

  test "should show event_instance" do
    get :show, :id => event_instances(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => event_instances(:one).to_param
    assert_response :success
  end

  test "should update event_instance" do
    put :update, :id => event_instances(:one).to_param, :event_instance => { }
    assert_redirected_to event_instance_path(assigns(:event_instance))
  end

  test "should destroy event_instance" do
    assert_difference('EventInstance.count', -1) do
      delete :destroy, :id => event_instances(:one).to_param
    end

    assert_redirected_to event_instances_path
  end
end
