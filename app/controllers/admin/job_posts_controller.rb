class Admin::JobPostsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_job_post, only: [:show, :edit, :update, :destroy]
  before_filter :correct_user

    def index
		@job_posts = JobPost.order('created_at desc') rescue nil
	end


	def new
		if params[:job_id].present?
			@job_post = JobPost.new 
			@job = Job.find(params[:job_id]) rescue nil
		else
			flash[:notice] = "No job available."
    	    redirect_to admin_root_path
		end
	end

	def create
		@job_post = JobPost.new(job_posts_params)
		if @job_post.save
			 flash[:notice] = "Successfully created."
			 redirect_to admin_root_path
	    else
	    	render :new
    		flash[:notice] = "Error creating."
    	end
	end

	def edit
		@job = Job.find(@job_post.job_id) rescue nil
	end

	def update
		@job_post.update(job_posts_params)
		flash[:notice] = "Updated successfully."
    	redirect_to admin_root_path
	end

	def delete
	   @job_post.destroy
       flash[:notice] = "Deleted successfully."
       redirect_to admin_root_path
	end

	def show
		
	end

	private
		def job_posts_params
	      params.require(:job_post).permit(:job_id,:company_id,:status)
	    end

	    def set_job_post
	      @job_post = JobPost.find(params[:id])
	    end

	    def correct_user
        user = current_user.is? :admin
	        unless user
	            flash[:notice] = "Access denied, there is no such page available."
	            redirect_to admin_root_path
	        end
	    end
end
