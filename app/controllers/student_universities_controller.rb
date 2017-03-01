class StudentUniversitiesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_student_university, only: [:edit, :update, :destroy]
  layout "dashboard", only: [ :index ]
  # GET /student_universities
  # GET /student_universities.json
  def index
    @student_universities = StudentUniversity.all
  end

  # GET /student_universities/1
  # GET /student_universities/1.json
  def show
  end

  # GET /student_universities/new
  def new
    @student_university = StudentUniversity.new
  end

  # GET /student_universities/1/edit
  def edit
  end

  # POST /student_universities
  # POST /student_universities.json
  def create
    @student_university = StudentUniversity.new(student_university_params)
      if @student_university.save
        redirect_to student_universities_url, notice: 'Student university was successfully created.'
      end
    
  end

  # PATCH/PUT /student_universities/1
  # PATCH/PUT /student_universities/1.json
  def update
    if @student_university.update(student_university_params)
      redirect_to student_universities_url, notice: 'Student university was successfully updated.' 
    end
  end

  # DELETE /student_universities/1
  # DELETE /student_universities/1.json
  def destroy
    @student_university.destroy
    respond_to do |format|
      format.html { redirect_to student_universities_url, notice: 'Student university was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_university
      @student_university = StudentUniversity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_university_params
      params.require(:student_university).permit(:country_id, :university_name)
    end
end
