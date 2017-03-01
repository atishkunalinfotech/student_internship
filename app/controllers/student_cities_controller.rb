class StudentCitiesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_student_city, only: [ :edit, :update, :destroy]
  layout "dashboard", only: [ :index ]
  # GET /student_cities
  # GET /student_cities.json
  def index
    @student_cities = StudentCity.all
  end

  # GET /student_cities/1
  # GET /student_cities/1.json
  def show
  end

  # GET /student_cities/new
  def new
    @student_city = StudentCity.new
  end

  # GET /student_cities/1/edit
  def edit
  end

  # POST /student_cities
  # POST /student_cities.json
  def create
    @student_city = StudentCity.new(student_city_params)

      if @student_city.save
      redirect_to student_cities_path, notice: 'Student city was successfully created.' 
        
      end
  end

  # PATCH/PUT /student_cities/1
  # PATCH/PUT /student_cities/1.json
  def update
    
      if @student_city.update(student_city_params)
         redirect_to student_cities_path, notice: 'Student city was successfully updated.' 
        
      end
   
  end

  # DELETE /student_cities/1
  # DELETE /student_cities/1.json
  def destroy
    @student_city.destroy
    respond_to do |format|
      format.html { redirect_to student_cities_url, notice: 'Student city was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_city
      @student_city = StudentCity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_city_params
      params.require(:student_city).permit(:student_city_name, :country_id)
    end
end
