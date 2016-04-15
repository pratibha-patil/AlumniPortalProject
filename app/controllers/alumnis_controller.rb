class AlumnisController < ApplicationController
	before_action :require_alumni, only: [:edit]
  def new
		@alumni = Alumni.new
	end
   def edit
      @alumni = Alumni.find(params[:id])

    end
	def create
    
      @alumni = Alumni.new(alumni_params)

      if @alumni.save
        redirect_to root_url
      else
       	redirect_to '/'
      end

  end
  def update
      @alumni = Alumni.find(params[:id])

      if @alumni.update(alumni_params)
        flash[:notice] = "Update Successful"
        redirect_to @alumni
      else
        render 'edit'
      end
   end
  def show
    
    @alumni=Alumni.find(params[:id])
  end
  #this method will list all alumni 
   def list
      session[:project]=params[:id];
     # @alumnis=Alumni.all
     @alumnis=Alumni.search(params[:search])
    end 
  
  def showprojects
    @projects=current_alumni.projects
  end
  private
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def alumni_params
      params.require(:alumni).permit(:first_name,:last_name, :email, :contact_no, :branch, :birthdate, :company, :post_in_company, :area_of_interest, :username,:password, :image)
    end
end
