class Admin::CountriesController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_admin_country, only: [:show, :edit, :update, :destroy]
    layout "dashboard", only: [ :index ]
  # GET /admin/countries
  # GET /admin/countries.json
  def index
    @admin_countries = Country.where('student_country = ?', true) rescue nil
  end

  # GET /admin/countries/1
  # GET /admin/countries/1.json
  def show
  end

  # GET /admin/countries/new
  def new
    @admin_country = Country.new
  end

  # GET /admin/countries/1/edit
  def edit
  end

  # POST /admin/countries
  # POST /admin/countries.json
  def create
  	
  	@admin_country = Country.find(params[:country][:id])
    @admin_country = @admin_country.update(admin_country_params)

  
        redirect_to admin_countries_path, notice: 'successfully created.'
        #format.json { render :show, status: :created, location: @admin_country }
  end

  # PATCH/PUT /admin/countries/1
  # PATCH/PUT /admin/countries/1.json
  def update
    respond_to do |format|
      if @admin_country.update(admin_country_params)
        format.html { redirect_to admin_countries_path, notice: 'successfully updated.' }
        #format.json { render :show, status: :ok, location: @admin_country }
      else
        format.html { render :edit }
        format.json { render json: @admin_country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/countries/1
  # DELETE /admin/countries/1.json
  def destroy
    @admin_country.destroy
    respond_to do |format|
      format.html { redirect_to admin_countries_url, notice: 'successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_country
      @admin_country = Country.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_country_params
      params.require(:country).permit(:country_name,:student_country)
    end
end
