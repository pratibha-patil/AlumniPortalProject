class ArticlesController < ApplicationController
  before_action :require_alumni, only: [:edit]
	 def index
    @articles = Article.where(alumni_id: params[:id])
    end

    def new
        @article=Article.new
    end
    def edit
      @article = Article.find(params[:id])
   end

    def create 
          @article = Article.new(article_params)
            @article.alumni_id = session[:alumni_id];
          if @article.save
            redirect_to @article
          else
            render 'new'
          end
    end
    def update
      @article = Article.find(params[:id])

      if @article.update(article_params)
        redirect_to @article
      else
        render 'edit'
      end
   end

    def show
    @article = Article.find(params[:id])
   end

   def listallarticles
     @articles =Article.all
   end
    def destroy
      @article = Article.find(params[:id])
      @article.destroy
      redirect_to articles_path
   end

    private
  def article_params
    params.require(:article).permit(:title, :content,:image)
  end	
end
