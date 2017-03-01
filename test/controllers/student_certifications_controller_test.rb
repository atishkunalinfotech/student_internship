require 'test_helper'

class StudentCertificationsControllerTest < ActionController::TestCase
  setup do
    @student_certification = student_certifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_certifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_certification" do
    assert_difference('StudentCertification.count') do
      post :create, student_certification: { certification: @student_certification.certification, country_id: @student_certification.country_id, grade: @student_certification.grade, institution: @student_certification.institution, major: @student_certification.major }
    end

    assert_redirected_to student_certification_path(assigns(:student_certification))
  end

  test "should show student_certification" do
    get :show, id: @student_certification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_certification
    assert_response :success
  end

  test "should update student_certification" do
    patch :update, id: @student_certification, student_certification: { certification: @student_certification.certification, country_id: @student_certification.country_id, grade: @student_certification.grade, institution: @student_certification.institution, major: @student_certification.major }
    assert_redirected_to student_certification_path(assigns(:student_certification))
  end

  test "should destroy student_certification" do
    assert_difference('StudentCertification.count', -1) do
      delete :destroy, id: @student_certification
    end

    assert_redirected_to student_certifications_path
  end
end
