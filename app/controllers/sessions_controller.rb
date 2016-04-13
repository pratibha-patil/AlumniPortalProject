class SessionsController < ApplicationController
	def new
	end
	def create
	  @student = Student.find_by_username(params[:session][:username])
	  if @student && @student.authenticate(params[:session][:Password])
	    session[:student_id] = @student.id
	    redirect_to '/students'
	  else
	  	flash[:message] = 'Invalid email/password combination' 
	    redirect_to '/login'
	  end 
    end
    def destroy 
	  session[:student_id] = nil 
	  redirect_to '/' 
    end

    def createalumni
	  @alumni = Alumni.find_by_username(params[:session][:username])
	  if @alumni && @alumni.authenticate(params[:session][:Password])
	    session[:alumni_id] = @alumni.id
	    redirect_to '/alumnis'
	  else
	  	flash[:message] = 'Invalid email/password combination' 
	    redirect_to '/loginalumni'
	  end 
    end
    def destroyalumni 
	  session[:alumni_id] = nil 
	  redirect_to '/' 
    end

end
