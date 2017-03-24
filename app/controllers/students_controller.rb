class StudentsController < ApplicationController
  before_filter :authenticate_student!
  before_filter :correct_student
  before_action :set_student, only: [:show, :edit, :update, :destroy]


  def edit
   @degrees = StudentUniversity.order(:university_name)
   @cities = StudentCity.order(:student_city_name)
	  @semester = SemesterRegistered.where('student_id = ?',current_student.id) rescue nil
  end

  def update
  	current_student.update(student_params)
	  Student.update_semester(params,current_student.id)
	  Student.update_myskill(params,current_student.id)
    Student.update_education(params,current_student.id)
    Student.update_student_work(params,current_student.id)
	  flash[:notice] = "Updated successfully."
	  redirect_to student_dashboard_path
  end

  def show
    @skill_groups = SkillGroup.all
    @semester = SemesterRegistered.where('student_id = ?',current_student.id) rescue nil
    @education = Education.where('student_id = ? and position = ?', current_student.id,1).first rescue nil
    @education1 = Education.where('student_id = ? and position = ?', current_student.id,2).first rescue nil
    @student_work_exp = StudentWorkExp.where('student_id = ? and wposition = ?', current_student.id,1).first rescue nil
    @student_work_exp1 = StudentWorkExp.where('student_id = ? and wposition = ?', current_student.id,2).first rescue nil
  end

  def change_password
    @user ||= current_student
  end

  def degrees_by_country
    if params[:id].present?
        @degrees = Country.find(params[:id]).student_universities.order(:university_name)
        @cities = Country.find(params[:id]).student_cities.order(:student_city_name)
      else
        @degrees = []
        @cities = []
      end
      respond_to do |format|
        format.js
      end
  end

  def update_password
      @user ||= current_student
      @user.password = student_params[:password]
    
      if @user.save(validate: false)
        flash[:notice] = "Your password successfully updated."
        sign_in @user, :bypass => true
        redirect_to student_dashboard_path
      else
        flash[:notice] = "Error in updating password."
        redirect_to admin_change_password_path
      end
    end

  private

    def student_params
        params.require(:student).permit(:email,:password,:attachment,:password_confirmation,:country_id,:internship_status_id,:studentid,:student_firstname,:student_middlename,:student_lastname,:student_email,:telephone,:gender,:status,:paid_status ,
          student_degrees_attributes: [:student_id,:degree,:major,:gpa,:student_university_id,:country_id,
            :garduation_year,:college,:student_city_id,:other_major,:_destroy,:id],
          student_certifications_attributes: [:student_id,:certification,:major,:institution, :country_id ,:grade,:other_major,:_destroy,:id] )
      end

    def set_student
      @student = Student.find(current_student.id)
    end
    
    def correct_student
        user = current_student
        unless user
            flash[:notice] = "Access denied, there is no such page available."
            redirect_to root_path
        end
    end
end
