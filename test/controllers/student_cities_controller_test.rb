require 'test_helper'

class StudentCitiesControllerTest < ActionController::TestCase
  setup do
    @student_city = student_cities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_cities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_city" do
    assert_difference('StudentCity.count') do
      post :create, student_city: { country_id: @student_city.country_id, student_city_name: @student_city.student_city_name }
    end

    assert_redirected_to student_city_path(assigns(:student_city))
  end

  test "should show student_city" do
    get :show, id: @student_city
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_city
    assert_response :success
  end

  test "should update student_city" do
    patch :update, id: @student_city, student_city: { country_id: @student_city.country_id, student_city_name: @student_city.student_city_name }
    assert_redirected_to student_city_path(assigns(:student_city))
  end

  test "should destroy student_city" do
    assert_difference('StudentCity.count', -1) do
      delete :destroy, id: @student_city
    end

    assert_redirected_to student_cities_path
  end
end
