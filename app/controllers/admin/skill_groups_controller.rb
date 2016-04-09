class Admin::SkillGroupsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_skill_group, only: [:show, :edit, :update, :destroy]
  before_filter :correct_user

    def index
		@skill_groups = SkillGroup.order('created_at desc')
	end


	def new
		@skill_group = SkillGroup.new 
	end

	def create
		@skill_group = SkillGroup.new(job_group_params)
		if @skill_group.save
			 flash[:notice] = "Successfully created Skill Group profile."
			 redirect_to admin_skill_groups_path
	    else
	    	render :new
    		flash[:notice] = "Error creating Skill Group profile."
    	end
	end

	def update
		@skill_group.update(job_group_params)
		flash[:notice] = "Updated successfully."
    	redirect_to admin_skill_groups_path
	end

	def destroy
	   @skill_group.destroy
       flash[:notice] = "Deleted successfully."
       redirect_to admin_skill_groups_path
	end

	def show
		
	end

	private
		def job_group_params
	      params.require(:skill_group).permit(:skill)
	    end

	    def set_skill_group
	      @skill_group = SkillGroup.find(params[:id])
	    end

	    def correct_user
        user = current_user.is? :admin
	        unless user
	            flash[:notice] = "Access denied, there is no such page available."
	            redirect_to dashboard_index_path
	        end
	    end
end
