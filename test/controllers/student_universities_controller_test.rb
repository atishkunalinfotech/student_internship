require 'test_helper'

class StudentUniversitiesControllerTest < ActionController::TestCase
  setup do
    @student_university = student_universities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_universities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_university" do
    assert_difference('StudentUniversity.count') do
      post :create, student_university: { country_id: @student_university.country_id, university_name: @student_university.university_name }
    end

    assert_redirected_to student_university_path(assigns(:student_university))
  end

  test "should show student_university" do
    get :show, id: @student_university
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_university
    assert_response :success
  end

  test "should update student_university" do
    patch :update, id: @student_university, student_university: { country_id: @student_university.country_id, university_name: @student_university.university_name }
    assert_redirected_to student_university_path(assigns(:student_university))
  end

  test "should destroy student_university" do
    assert_difference('StudentUniversity.count', -1) do
      delete :destroy, id: @student_university
    end

    assert_redirected_to student_universities_path
  end
end
