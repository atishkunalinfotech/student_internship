class JobPostsController < ApplicationController
  before_filter :authenticate_student!
  before_action :set_job_post, only: [:show, :edit, :update, :destroy]
  before_filter :correct_student

    def index
		@job_posts = JobPost.order('created_at desc') rescue nil
	end

	def show
		@job = Job.find(@job_post.job_id) rescue nil
	end
    
    def job_interest_post
    	@job = JobPost.find(params[:job_id]) rescue nil
		@student_interest = StudentJobInterest.create(:job_id => params[:job_id],:student_id => current_student.id, :company_id => @job.company_id)
	    flash[:notice] = "Successfully Applied."
	    redirect_to student_dashboard_path
	end

	private

	    def set_job_post
	      @job_post = JobPost.find(params[:id])
	    end

	    def correct_student
	        user = current_student
	        unless user
	            flash[:notice] = "Access denied, there is no such page available."
	            redirect_to root_path
	        end
        end
end
