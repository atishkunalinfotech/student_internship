class StudentDashboardController < ApplicationController
  before_filter :authenticate_student!
  before_filter :correct_student
  
  def index
  	
  end

  private
    def correct_student
        user = current_student
        unless user
            flash[:notice] = "Access denied, there is no such page available."
            redirect_to root_path
        end
    end
end
