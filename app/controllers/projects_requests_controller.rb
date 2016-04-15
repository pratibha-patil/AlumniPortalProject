class ProjectsRequestsController < ApplicationController
	def create
		@projectrequest=ProjectRequest.new
		@projectrequest.project_id=session[:project];
		@projectrequest.alumni_id=params[:id]
		@projectrequest.status="false"

		if @projectrequest.save
            redirect_to(:back)
          else
            render '/'
          end
	end

	def requests
		@projectrequest=ProjectRequest.where("alumni_id = :alumni_id AND status = :status",
			{alumni_id: current_alumni.id, status: "false"})

	end
	
	def accept
		@request = ProjectRequest.find(params[:id])
		@request.status = "true"
		@request.save
		@project = @request.project
		@rejects = ProjectRequest.where("project_id = :project_id AND status = :status",
			{project_id: @project.id, status: "false"})
		@rejects.each do |reject|
			reject.destroy
		end

		redirect_to getrequests_path

	end

	def update
      @request = ProjectRequest.where(params[:id])

      if @request.update(request_params)
        redirect_to @request
      else
        render '/'
      end
   end
   	def showprojects
       @projectaccepted=ProjectRequest.where("alumni_id = :alumni_id AND status = :status",
			{alumni_id: current_alumni.id, status: "true"})
  	end
   	private
  def request_params
    params.require(:project_requests).permit(:project_id, :alumni_id,:status)
  end
end
