class Admin::CompaniesController < ApplicationController
	before_filter :authenticate_user!
    before_action :set_company, only: [:show, :edit, :update, :destroy]
    before_filter :correct_user
    require 'rails_autolink'
	def index
		@company = Company.order('created_at desc')
	end


	def new
		@company = Company.new 
	end

	def create
		@company = Company.new(company_params)
		if @company.save
			 flash[:notice] = "Successfully created company profile."
			 redirect_to admin_companies_path
	    else
	    	render :new
    		flash[:notice] = "Error creating company profile."
    	end
	end

	def update
		@company.update(company_params)
		flash[:notice] = "Updated successfully."
    	redirect_to admin_companies_path
	end

	def delete
	   @company.destroy
       flash[:notice] = "Deleted successfully."
       redirect_to admin_companies_path
	end

	def show
		
	end

	private
		def company_params
	      params.require(:company).permit(:internship_type, :company_name, :address, :city, :postal,:country,:contact_person_first,
	      	:contact_person_last,:contact_person_position,:telephone,:email,:company_website,:notes)
	    end

	    def set_company
	      @company = Company.find(params[:id])
	    end

	    def correct_user
        user = current_user.is? :admin
	        unless user
	            flash[:notice] = "Access denied, there is no such page available."
	            redirect_to dashboard_index_path
	        end
        end
end