require 'test_helper'

class Admin::CitiesControllerTest < ActionController::TestCase
  setup do
    @admin_city = admin_cities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_cities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_city" do
    assert_difference('Admin::City.count') do
      post :create, admin_city: { city_name: @admin_city.city_name }
    end

    assert_redirected_to admin_city_path(assigns(:admin_city))
  end

  test "should show admin_city" do
    get :show, id: @admin_city
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_city
    assert_response :success
  end

  test "should update admin_city" do
    patch :update, id: @admin_city, admin_city: { city_name: @admin_city.city_name }
    assert_redirected_to admin_city_path(assigns(:admin_city))
  end

  test "should destroy admin_city" do
    assert_difference('Admin::City.count', -1) do
      delete :destroy, id: @admin_city
    end

    assert_redirected_to admin_cities_path
  end
end
