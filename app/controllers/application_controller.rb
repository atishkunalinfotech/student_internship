class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource_or_scope)
    if current_user
    	if current_user.role == 'admin'
    		admin_root_path
    	else
  	    root_path
  	  end
    else
      if current_student
        student_dashboard_path
      else
        root_path
      end
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |student| u.permit(:email, :password, :password_confirmation, 
    	:remember_me,:sign_in_count,:studentid,:student_firstname,:student_middlename,:student_lastname,:telephone,:gender,:status,:paid_status) }
  end

end