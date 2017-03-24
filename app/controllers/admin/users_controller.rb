class Admin::UsersController < ApplicationController
	before_filter :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :correct_user
  layout "dashboard", only: [ :index ]


    def index   
	    @users = User.where( 'role != ? ', "admin").order('created_at desc') rescue nil
	end


	def new

		@user = User.new 
	end

	def student_profile
		#@student = Student.new
		@student = Student.find(params[:student_id])
		@skill_groups = SkillGroup.all
	end
# 
	def create
		@user = User.new(user_params)
		password_length = 8
        password = Devise.friendly_token.first(password_length)
        @user.password = password
			if @user.save
				AgentMailer.agent_mail(@user.email,@user.password).deliver_now
				flash[:notice] = "Successfully created login."
				redirect_to admin_users_path(:role => @user.role)
		    else
		    	render :new
	    		flash[:notice] = "Error creating login."
	    	end
	end

	def user_change_password
		@user = User.find(params[:user_id])
	end

	def user_update_password
	    @user = User.find(params[:user_id])
	    @user.password = user_params[:password]
	    
	    if @user.save(validate: false)
	      flash[:notice] = "User password successfully updated."
	      sign_in @user, :bypass => true
	      redirect_to admin_root_path
	    else
	      flash[:notice] = "Error in updating password."
	      redirect_to admin_change_password_path
	    end
    end

	

	def update
		@user.update(student_params)
		flash[:notice] = "Updated successfully."
    	redirect_to admin_root_path
	end

	def destroy
	   @user.destroy
       flash[:notice] = "Deleted successfully."
       redirect_to admin_users_path
	end


	private
		def user_params
	      params.require(:user).permit(:email,:password,:password_confirmation,:first_name,:last_name,:role)
	    end

	    def set_user
	      @user = User.find(params[:id])
	      #raise @student.inspect
	    end

	    def correct_user
        #user = current_user.is? :admin || current_user.is? :faculty || current_user.is? :staff
	        
	        if current_user.is? :admin
	        elsif current_user.is? :faculty
	        elsif current_user.is? :staff
	        else		
	       	
	            flash[:notice] = "Access denied, there is no such page available."
	            redirect_to admin_root_path
	        end
	    end
end
