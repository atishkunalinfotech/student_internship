class Admin::JobGroupsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_job_group, only: [:show, :edit, :update, :destroy]
  before_filter :correct_user

  def index
		@job_groups = JobGroup.order('created_at desc')
	end


	def new
		@job_group = JobGroup.new 
	end

	def create
		@job_group = JobGroup.new(job_group_params)
		if @job_group.save
			 flash[:notice] = "Successfully created Job Group profile."
			 redirect_to admin_job_groups_path
	    else
	    	render :new
    		flash[:notice] = "Error creating Job Group profile."
    	end
	end

	def update
		@job_group.update(job_group_params)
		flash[:notice] = "Updated successfully."
    	redirect_to admin_job_groups_path
	end

	def destroy
	   @job_group.destroy
       flash[:notice] = "Deleted successfully."
       redirect_to admin_job_groups_path
	end

	def show
		
	end

	private
		def job_group_params
	      params.require(:job_group).permit(:job_model_name)
	    end

	    def set_job_group
	      @job_group = JobGroup.find(params[:id])
	    end

	    def correct_user
        user = current_user.is? :admin
	        unless user
	            flash[:notice] = "Access denied, there is no such page available."
	            redirect_to dashboard_index_path
	        end
	    end
end
