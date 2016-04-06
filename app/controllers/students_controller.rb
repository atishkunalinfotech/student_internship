class StudentsController < ApplicationController
  before_filter :authenticate_student!
  before_filter :correct_student
  before_action :set_student, only: [:show, :edit, :update, :destroy]


  def edit
  	@skill_groups = SkillGroup.all
	@semester = SemesterRegistered.where('student_id = ?',current_student.id) rescue nil
	@education = Education.where('student_id = ? and position = ?', current_student.id,1) rescue nil
	@education1 = Education.where('student_id = ? and position = ?', current_student.id,2) rescue nil
	@student_work_exp = StudentWorkExp.where('student_id = ? and wposition = ?', current_student.id,1) rescue nil
	@student_work_exp1 = StudentWorkExp.where('student_id = ? and wposition = ?', current_student.id,2) rescue nil
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

  private

    def student_params
      params.require(:student).permit(:email,:password,:password_confirmation,:country,:internship_status_id,:studentid,:student_firstname,:student_middlename,:student_lastname,:student_email,:telephone,:gender,:status,:paid_status ,educations_attributes: [:student_id,:degree_type,:major,:degree_gpa,:degree_university,:degree_university_loc,:certifications,:certification_body,:_destroy] )
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
