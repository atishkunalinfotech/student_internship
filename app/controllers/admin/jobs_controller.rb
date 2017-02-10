class Admin::JobsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_filter :correct_user
  layout "dashboard", only: [ :index ]
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

	def publish_unpublish
		@job = Job.find(params[:id])
		#raise params[:publish].to_i.inspect
		@job.publish_unpublish = params[:publish].to_i
		@job.update_attributes(:publish_unpublish => params[:publish].to_i)
		flash[:notice] = "Updated successfully."
    	redirect_to admin_jobs_path
	end

	def destroy
	   @job.destroy
       flash[:notice] = "Deleted successfully."
       redirect_to admin_jobs_path
	end

	def show
		
	end

	private
		def job_params
	      params.require(:job).permit(:job_group_id,:company_id,:status,:publish_unpublish, :job_name,:description,:responsibilities,:requirements,:salary)
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
