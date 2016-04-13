class StudentsController < ApplicationController

 before_action :require_student, only: [:index, :show,:edit]

	def new
		@student = Student.new
	end
  def edit
      @student = Student.find(params[:id])
  end
	def create
    
      @student = Student.new(student_params)

      if @student.save
        redirect_to root_url
      else
       	redirect_to '/'
      end

  end
  def show
     @student=Student.find(params[:id])
  end
  def update
      @student = Student.find(params[:id])

      if @student.update(student_params)
        redirect_to @student
      else
        render 'edit'
      end
   end
  private
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:first_name,:last_name, :PRN_no, :email, :contact_no, :branch, :birthdate, :username,:password, :image)
    end
end
