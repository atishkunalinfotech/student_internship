class Admin::EducationsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_education, only: [:show, :edit, :update, :destroy]
  before_filter :correct_user

    def index
		@educations = Education.order('created_at desc')
	end


	def new
		@education = Education.new 
	end

	def create
		@education = Education.new(education_params)
		
		if @education.save
			 flash[:notice] = "Successfully created."
			 #redirect_to admin_student_profile_path(@education.student_id)
			 redirect_to admin_students_path
	    else
	    	render :new
    		flash[:notice] = "Error creating."
    	end
	end

	def update
		@education.update(education_params)
		flash[:notice] = "Updated successfully."
    	redirect_to admin_students_path
	end

	def delete
	   @education.destroy
       flash[:notice] = "Deleted successfully."
       redirect_to admin_students_path
	end

	def show
		
	end

	private
		def education_params
	      params.require(:education).permit(:student_id,:degree_type,:major,:degree_gpa,:degree_university,:degree_university_loc,:certifications,:certification_body)
	    end

	    def set_education
	      @student = Education.find(params[:id])
	    end

	    def correct_user
        user = current_user.is? :admin
	        unless user
	            flash[:notice] = "Access denied, there is no such page available."
	            redirect_to dashboard_index_path
	        end
	    end
	
end









