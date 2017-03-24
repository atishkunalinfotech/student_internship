class Admin::CitiesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user
  before_action :set_admin_city, only: [:show, :edit, :update, :destroy]
  layout "dashboard", only: [ :index ]
  # GET /admin/cities
  # GET /admin/cities.json
  def index
    @admin_cities = Admin::City.all
  end

  # GET /admin/cities/1
  # GET /admin/cities/1.json
  def show
  end

  # GET /admin/cities/new
  def new
    @admin_city = Admin::City.new
  end

  # GET /admin/cities/1/edit
  def edit
  end

  # POST /admin/cities
  # POST /admin/cities.json
  def create
    @admin_city = Admin::City.new(admin_city_params)

    respond_to do |format|
      if @admin_city.save
        format.html { redirect_to admin_cities_url, notice: 'City was successfully created.' }
        format.json { render :show, status: :created, location: admin_cities_url }
      else
        format.html { render :new }
        format.json { render json: @admin_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/cities/1
  # PATCH/PUT /admin/cities/1.json
  def update
    respond_to do |format|
      if @admin_city.update(admin_city_params)
        format.html { redirect_to admin_cities_url, notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: admin_cities_url }
      else
        format.html { render :edit }
        format.json { render json: @admin_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/cities/1
  # DELETE /admin/cities/1.json
  def destroy
    @admin_city.destroy
    respond_to do |format|
      format.html { redirect_to admin_cities_url, notice: 'City was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_city
      @admin_city = Admin::City.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_city_params
      params.require(:admin_city).permit(:city_name)
    end

    def correct_user
        user = current_user.is? :admin
          unless user
              flash[:notice] = "Access denied, there is no such page available."
              redirect_to dashboard_index_path
          end
      end
end
