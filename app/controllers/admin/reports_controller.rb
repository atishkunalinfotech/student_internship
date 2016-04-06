class Admin::ReportsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user


  def index
  	
  end

  def student_reports
    if params[:subaction] == "Find"
      all_student = params[:student_type][:student_type] rescue ""
      all_student_field = params[:student_type_field] rescue ""
      if all_student.blank? and all_student_field.blank?
        flash[:notice] = "Please select All students or enter Student Id to search."
        redirect_to admin_reports_path
      elsif all_student.present? and all_student_field.present?
        flash[:notice] = "Please select only one field All students or enter Student Id to search."
        redirect_to admin_reports_path
      elsif all_student.present?
        @students = Student.all
      else
        @students = Student.where('studentid = ?',all_student_field) rescue nil
        unless @students.present?
          flash[:notice] = "There is no student to search"
          redirect_to admin_reports_path
        end
      end
      country = params[:students][:country] rescue ""
      if country.present?
        @students = @students.where('country = ?',country) rescue nil
      end
      with_job = params[:students][:with_job] rescue ""
      if with_job.present?
        if with_job == "Available"
          @internship = InternshipStatus.where('internship_status_name = ?',"Available").first rescue nil
          @students = @students.where('internship_status_id = ?',@internship.id) rescue nil
        else
          @internship = InternshipStatus.where('internship_status_name = ?',"Hired").first rescue nil
          @students = @students.where('internship_status_id = ?',@internship.id) rescue nil
        end
      end
      paid_status = params[:students][:paid_status] rescue ""
      if paid_status.present?
        @student_job_interests = StudentJobInterest.where('paid_status = ?',paid_status) rescue nil
         @a = []
         @student_job_interests.each do |stu|
           @a << @students.where('id = ?',stu.student_id).first
         end
         @students = @a
      end
      semester = params[:students][:semester] rescue ""
      if semester.present?
          @ab = []
         @students.each do |stu|
           if stu.present?
              @ab << stu.semester_registereds.where('semester = ?',semester) rescue nil
           end
         end
         @b = []
         @ab.each do |a|
          if a.present?
           @students.each do |stu|
             if stu.present?
                if a.first.student_id == stu.id
                  @b << stu rescue nil
                end
             end
           end
          end
         end
         @students = @b
      end

      year = params[:year] rescue ""
      if year.present?
         @a = []
         @students.each do |stu|
           @a << SemesterRegistered.where('student_id = ? and student_year = ?',stu.id,year) rescue nil
         end
         @b = []
         @a.each do |a|
          if a.present?
           @students.each do |stu|
              if stu.present?
                if stu.id == a.first.student_id
                  @b << stu rescue nil
                end
              end
           end
          end
         end
         @students = @b
      end

      company = params[:company] rescue ""
      if company.present?
        @student_job_interests = StudentJobInterest.where('company_id = ?',company) rescue nil
        @a = []
         @student_job_interests.each do |stu|
           @students.each do |student|
            if student.present?
             if student.id == stu.student_id
                @a << student rescue nil
             end
            end
           end
         end
         @students = @a.uniq
      end

      gpa = params[:students][:gpa] rescue ""
      if gpa.present?
        if gpa == "Avg Current GPA"
            @a = []
            @b = []
           @students.each do |stu|
             @a << Education.select(:degree_gpa).where('student_id = ? and position = ?',stu.id,2)
             @a.each do |a|
              if a.present?
                @b << a.first.degree_gpa
              end
             end
           end
        else
           @a = []
           @b = []
           @students.each do |stu|
             @a << Education.select(:degree_gpa).where('student_id = ? and position = ?',stu.id,1)
             @a.each do |a|
              @b << a.first.degree_gpa
             end
           end
        end
        if @b.present?
          @array = @b.inject{ |sum, el| sum + el }.to_f / @b.size
        else
          @array = []
        end
      end

    elsif params[:companyaction] == "Find"
      raise "hi"
    end
  end

  def company_reports
    raise "hi"
  end

  private
    def correct_user
        user = current_user.is? :admin
	        unless user
	            flash[:notice] = "Access denied, there is no such page available."
	            redirect_to dashboard_index_path
	        end
	    end
end
