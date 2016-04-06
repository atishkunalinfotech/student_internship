class Admin::InternshipStatusesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_internship_status, only: [:show, :edit, :update, :destroy]
  before_filter :correct_user

    def index
		@internship_statuses = InternshipStatus.order('created_at desc') rescue nil
	end


	def new
		@internship_status = InternshipStatus.new 
	end

	def create
		@internship_status = InternshipStatus.new(internship_status_params)
		if @internship_status.save
			 flash[:notice] = "Successfully created."
			 redirect_to admin_root_path
	    else
	    	render :new
    		flash[:notice] = "Error creating."
    	end
	end

	def update
		@internship_status.update(internship_status_params)
		flash[:notice] = "Updated successfully."
    	redirect_to admin_root_path
	end

	def delete
	   @internship_status.destroy
       flash[:notice] = "Deleted successfully."
       redirect_to admin_root_path
	end

	def show
		
	end

	private
		def internship_status_params
	      params.require(:internship_status).permit(:internship_status_name)
	    end

	    def set_internship_status
	      @internship_status = InternshipStatus.find(params[:id])
	    end

	    def correct_user
        user = current_user.is? :admin
	        unless user
	            flash[:notice] = "Access denied, there is no such page available."
	            redirect_to admin_root_path
	        end
	    end
end
