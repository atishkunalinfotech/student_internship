class Admin::JobsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_filter :correct_user

  def index
		@jobs = Job.order('created_at desc')
	end


	def new
		@job = Job.new 
	end

	def create
		@job = Job.new(job_params)
		if @job.save
			 flash[:notice] = "Successfully created Job profile."
			 redirect_to admin_jobs_path
	    else
	    	render :new
    		flash[:notice] = "Error creating Job profile."
    	end
	end

	def update
		@job.update(job_params)
		flash[:notice] = "Updated successfully."
    	redirect_to admin_jobs_path
	end

	def delete
	   @job.destroy
       flash[:notice] = "Deleted successfully."
       redirect_to admin_jobs_path
	end

	def show
		
	end

	private
		def job_params
	      params.require(:job).permit(:job_group_id,:job_name,:description,:responsibilities,:requirements,:salary)
	    end

	    def set_job
	      @job = Job.find(params[:id])
	    end

	    def correct_user
        user = current_user.is? :admin
	        unless user
	            flash[:notice] = "Access denied, there is no such page available."
	            redirect_to dashboard_index_path
	        end
	    end
end
