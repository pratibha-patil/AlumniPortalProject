class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  
  protect_from_forgery with: :exception
  helper_method :current_student 
  helper_method :current_alumni
	def current_student 
	  @current_student ||= Student.find(session[:student_id]) if session[:student_id] 
	  
	end
	def require_student 
	  redirect_to '/login' unless current_student 
	end

	def current_alumni 
	  @current_alumni ||= Alumni.find(session[:alumni_id]) if session[:alumni_id] 
	end
	def require_alumni 
	  redirect_to '/loginalumni' unless current_alumni 
	end
	

end
