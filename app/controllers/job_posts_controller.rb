class JobPostsController < ApplicationController
  before_filter :authenticate_student!
  before_action :set_job_post, only: [:show, :edit, :update, :destroy]
  before_filter :correct_student
  layout "dashboard", only: [ :index ]
    def index
		@jobs = Job.order('created_at desc') rescue nil
	end

	def show
		raise "hi"
		@job = Job.find(@job_post.job_id) rescue nil
	end
    
    def job_interest_post
    	@job = Job.where('id = ?',params[:job_id]).first rescue nil
		@student_interest = StudentJobInterest.create(:job_id => @job.id,:student_id => current_student.id, :company_id => @job.company_id)
	    flash[:notice] = "Successfully Applied."
	    redirect_to job_posts_path
	end

	def job_show
		@job = Job.find(params[:id]) rescue nil
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
