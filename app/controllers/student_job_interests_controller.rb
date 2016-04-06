class StudentJobInterestsController < ApplicationController
  before_filter :authenticate_student!
  before_action :set_job_interest, only: [:show, :edit, :update, :destroy]
  before_filter :correct_student

	def new
		@student_interest = StudentJobInterest.new 
	end


	def create
		@student_interest = StudentJobInterest.new(student_interest_params)
		if @job_group.save
			 flash[:notice] = "Successfully created Job Group profile."
			 redirect_to admin_job_groups_path
	    else
	    	render :new
    		flash[:notice] = "Error creating Job Group profile."
    	end
	end


	private
	    def student_interest_params
	      params.require(:student_job_interest).permit(:job_id,:student_id,:company_id)
	    end

	    def correct_student
	        user = current_student
	        unless user
	            flash[:notice] = "Access denied, there is no such page available."
	            redirect_to root_path
	        end
        end
end
