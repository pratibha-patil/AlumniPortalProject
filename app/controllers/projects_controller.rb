 class ProjectsController < ApplicationController
	 before_action :require_student, only: [:edit]
   def index
    @projects = Project.all
    end

    def new
        @project=Project.new
    end
    def edit
      @project = Project.find(params[:id])
    end

   def create 
          @project = Project.new(project_params)
          @project.student_id = session[:student_id];
          if @project.save
            redirect_to @project
          else
            render 'new'
          end
    end
    def update
      @project = Project.find(params[:id])

      if @project.update(project_params)
        redirect_to @project
      else
        render 'edit'
      end
   end

   def show
    @project = Project.find(params[:id])
   end
    def destroy
      @project = Project.find(params[:id])
      
      ProjectRequest.where(project_id: @project.id).destroy_all
      @project.destroy
      redirect_to projects_path
   end

    private
  def project_params
    params.require(:project).permit(:project_name, :details)
  end
end
