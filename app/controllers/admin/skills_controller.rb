class Admin::SkillsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_skill, only: [:show, :edit, :update, :destroy]
  before_filter :correct_user

    def index
		@skills = Skill.order('created_at desc')
	end


	def new
		@skill = Skill.new 
	end

	def create
		@skill = Skill.new(skill_params)
		if @skill.save
			 flash[:notice] = "Successfully created Skill."
			 redirect_to admin_skills_path
	    else
	    	render :new
    		flash[:notice] = "Error creating Skill."
    	end
	end

	def update
		@skill.update(skill_params)
		flash[:notice] = "Updated successfully."
    	redirect_to admin_skills_path
	end

	def destroy
	   @skill.destroy
       flash[:notice] = "Deleted successfully."
       redirect_to admin_skills_path
	end

	def show
		
	end

	private
		def skill_params
	      params.require(:skill).permit(:skill_group_id,:skill_name)
	    end

	    def set_skill
	      @skill = Skill.find(params[:id])
	    end

	    def correct_user
        user = current_user.is? :admin
	        unless user
	            flash[:notice] = "Access denied, there is no such page available."
	            redirect_to dashboard_index_path
	        end
	    end
end