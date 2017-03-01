require 'test_helper'

class Admin::StudentMajorsControllerTest < ActionController::TestCase
  setup do
    @admin_student_major = admin_student_majors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_student_majors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_student_major" do
    assert_difference('Admin::StudentMajor.count') do
      post :create, admin_student_major: { major_name: @admin_student_major.major_name }
    end

    assert_redirected_to admin_student_major_path(assigns(:admin_student_major))
  end

  test "should show admin_student_major" do
    get :show, id: @admin_student_major
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_student_major
    assert_response :success
  end

  test "should update admin_student_major" do
    patch :update, id: @admin_student_major, admin_student_major: { major_name: @admin_student_major.major_name }
    assert_redirected_to admin_student_major_path(assigns(:admin_student_major))
  end

  test "should destroy admin_student_major" do
    assert_difference('Admin::StudentMajor.count', -1) do
      delete :destroy, id: @admin_student_major
    end

    assert_redirected_to admin_student_majors_path
  end
end
