class Admin::StudentJobInterestsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_skill_group, only: [:show, :edit, :update, :destroy]
  before_filter :correct_user

    def index
		@student_job_interests = StudentJobInterest.where('select_profile_status = ? and reject_profile = ?',false,false).order('created_at desc')
	end


	def new
		@student_job_interest = StudentJobInterest.new 
	end

	def create
		@student_job_interest = StudentJobInterest.new(student_job_interest_params)
		if @student_job_interest.save
			 flash[:notice] = "Successfully created Skill Group profile."
			 redirect_to admin_dashboard_path
	    else
	    	render :new
    		flash[:notice] = "Error creating Skill Group profile."
    	end
	end

	def update
		@skill_group.update(student_job_interest_params)
		flash[:notice] = "Updated successfully."
    	redirect_to admin_dashboard_path
	end

	def delete
	   @skill_group.destroy
       flash[:notice] = "Deleted successfully."
       redirect_to admin_dashboard_path
	end

	def show
		
	end

	def student_hire
       @student_job_interests = StudentJobInterest.where('select_profile_status = ? and reject_profile = ?',true,false).order('created_at desc')
    end

    def hire_student
    	@student_job_interest = StudentJobInterest.where('student_id = ? and id = ?',params[:student_id],params[:student_job_interest]).first rescue nil
		@student_job_interest.update(:is_hire => 1)
		@student = Student.find(params[:student_id]) rescue nil
		@internship = InternshipStatus.where('internship_status_name = ?', "Hired").first rescue nil
		@student.update(:internship_status_id => @internship.id)
		@job = Job.where('id = ?',@student_job_interest.job_id).first
		if @job.salary.present? 
			@student_job_interest.update(:paid_status => "Paid")
		else
			@student_job_interest.update(:paid_status => "Unpaid")
		end
		flash[:notice] = "Student hired."
		redirect_to admin_student_hire_path
    end

    def not_hired_student
    	@student_job_interest = StudentJobInterest.where('student_id = ? and id = ?',params[:student_id],params[:student_job_interest]).first rescue nil
		@student_job_interest.update(:is_hire => 2)
		flash[:notice] = "Student not hired."
		redirect_to admin_student_hire_path
    end

	def select_student_profile
		@student_job_interest = StudentJobInterest.where('student_id = ? and id = ?',params[:student_id],params[:student_job_interest]) rescue nil
		@student_job_interest.update_all(:select_profile_status => true)
		flash[:notice] = "Profile Selected Successfully."
		redirect_to admin_student_job_interests_path
	end

	def reject_student_profile
		@student_job_interest = StudentJobInterest.where('student_id = ? and id = ?',params[:student_id],params[:student_job_interest]) rescue nil
		@student_job_interest.update_all(:reject_profile => true)
		flash[:notice] = "Profile rejected Successfully."
		redirect_to admin_student_job_interests_path
	end

	private
		def student_job_interest_params
	      params.require(:skill_group).permit(:job_id,:student_id,:company_id,:select_profile_status,:paid_status,:reject_profile, :is_hire)
	    end

	    def set_skill_group
	      #@skill_group = SkillGroup.find(params[:id])
	    end

	    def correct_user
        user = current_user.is? :admin
	        unless user
	            flash[:notice] = "Access denied, there is no such page available."
	            redirect_to dashboard_index_path
	        end
	    end
end
