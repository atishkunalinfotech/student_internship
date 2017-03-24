class Admin::StudentMajorsController < ApplicationController
  
  before_filter :authenticate_user!
    before_action :set_admin_student_major, only: [ :edit, :update, :destroy]
    before_filter :correct_user
    layout "dashboard", only: [ :index ]
  # GET /admin/student_majors
  # GET /admin/student_majors.json
  def index
    @admin_student_majors = Admin::StudentMajor.all
  end

  # GET /admin/student_majors/1
  # GET /admin/student_majors/1.json
  def show
  end

  # GET /admin/student_majors/new
  def new
    @admin_student_major = Admin::StudentMajor.new
  end

  # GET /admin/student_majors/1/edit
  def edit
  end

  # POST /admin/student_majors
  # POST /admin/student_majors.json
  def create
    @admin_student_major = Admin::StudentMajor.new(admin_student_major_params)

    respond_to do |format|
      if @admin_student_major.save
        format.html { redirect_to admin_student_majors_url, notice: 'Student major was successfully created.' }
        format.json { render :show, status: :created, location: admin_student_majors_url }
      else
        format.html { render :new }
        format.json { render json: @admin_student_major.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/student_majors/1
  # PATCH/PUT /admin/student_majors/1.json
  def update
    
      if @admin_student_major.update(admin_student_major_params)
        redirect_to admin_student_majors_path, notice: 'Student major was successfully updated.' 
        
      end
  
  end

  # DELETE /admin/student_majors/1
  # DELETE /admin/student_majors/1.json
  def destroy
    @admin_student_major.destroy
    respond_to do |format|
      format.html { redirect_to admin_student_majors_url, notice: 'Student major was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_student_major
      @admin_student_major = Admin::StudentMajor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_student_major_params
      params.require(:admin_student_major).permit(:major_name)
    end

    def correct_user
        user = current_user.is? :admin
          unless user
              flash[:notice] = "Access denied, there is no such page available."
              redirect_to dashboard_index_path
          end
      end
end
