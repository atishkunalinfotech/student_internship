class Admin::StudentsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_filter :correct_user
  layout "dashboard", only: [ :index ]

    def index
		@students = Student.order('created_at desc')
	end


	def new
		@student = Student.new 
		@internship = InternshipStatus.where('internship_status_name = ?',"Available").first rescue nil
	end

	def student_profile
		#@student = Student.new
		@student = Student.find(params[:student_id])
	end
# 
	def create
		@student = Student.new(student_params)
		password_length = 8
        password = Devise.friendly_token.first(password_length)
        @student.password = password
		@student_present = Student.find(params[:student][:student_id]) rescue nil
		@internship = InternshipStatus.where('internship_status_name = ?',"Available").first rescue nil
		
		if params[:student][:student_profile] == "student_profile"
			if @student.save
				AgentMailer.agent_mail(@student.email,@student.password).deliver
				SemesterRegistered.create(:student_id => @student.id)
				flash[:notice] = "Successfully created Student login."
				redirect_to admin_students_path(:student_id => @student.id)
		    else
		    	render :new
	    		flash[:notice] = "Error creating Student login."
	    	end
	    else
	    	@student_present.update(student_params)
	    	Student.semester(params,@student_present.id)
			flash[:notice] = "Updated successfully."
	    	redirect_to admin_students_path
	    end
	end

	def change_password
		@student = Student.find(params[:stu_id])
	end

	def update_password
	    @student = Student.find(params[:stu_id])
	    @student.password = student_params[:password]
	    
	    if @student.save(validate: false)
	      flash[:notice] = "Student password successfully updated."
	      sign_in @student, :bypass => true
	      redirect_to admin_students_path
	    else
	      flash[:notice] = "Error in updating password."
	      redirect_to admin_change_password_path
	    end
    end

	def edit
		@degrees = StudentUniversity.order(:university_name)
	    @cities = StudentCity.order(:student_city_name)
		@semester = SemesterRegistered.where('student_id = ?',@student.id) rescue nil
	end

	def degrees_by_country
		if params[:id].present?
	      @degrees = Country.find(params[:id]).student_universities.order(:university_name)
	      @cities = Country.find(params[:id]).student_cities.order(:student_city_name)
	    else
	      @degrees = []
	      @cities = []
	    end
	    respond_to do |format|
	      format.js
	    end
	end

	def update
        #raise params.inspect
		@student.update(student_params)
		#town =  params[:txt_review_town_id].to_s
		#raise params[:student][:student_degrees_attributes][:degree].inspect
		# if (town.present?)
  #         town_db = Admin::StudentMajor.find_or_create_by(:major_name=>town)
  #         #@review.town_id = town_db.id
  #       end
		Student.update_semester(params,@student.id)
		flash[:notice] = "Updated successfully."
    	redirect_to admin_students_path
	end

	def destroy
	   @student.destroy
       flash[:notice] = "Deleted successfully."
       redirect_to admin_students_path
	end

	def show
		@skill_groups = SkillGroup.all
		@semester = SemesterRegistered.where('student_id = ?',@student.id) rescue nil
	end

	private
		def student_params
	      params.require(:student).permit(:email,:password,:attachment,:password_confirmation,:country_id,:internship_status_id,:studentid,:student_firstname,:student_middlename,:student_lastname,:student_email,:telephone,:gender,:status,:paid_status ,
	      	student_degrees_attributes: [:student_id,:degree,:major,:gpa,:student_university_id,:country_id,
	      		:garduation_year,:college,:student_city_id,:other_major,:_destroy,:id],
	      	student_certifications_attributes: [:student_id,:certification,:major,:institution, :country_id ,:grade,:other_major,:_destroy,:id] )
	    end

	    def set_student
	      @student = Student.find(params[:id])
	      #raise @student.inspect
	    end

	    def correct_user
        user = current_user.is? :admin
	        unless user
	            flash[:notice] = "Access denied, there is no such page available."
	            redirect_to dashboard_index_path
	        end
	    end
end