class ArticlesController < ApplicationController

    def show
        @article = Article.find(params[:id])
    end

    def new

        puts current_user

        @article = Article.new
    end
    
    def create
        @article = Article.new(article_params)
        @article.user = current_user
    
    if @article.save
          redirect_to @article
    else
           render 'new'
    end
    
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def update
        @article = Article.find(params[:id])

        authorize @article
    
        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
        end
    end

    def destroy

      authorize @article

      @article = Article.find(params[:id])
      @article.destroy
  
      redirect_to root_path
    end

    private
    def article_params
      params.require(:article).permit(:title, :body)
    end

end
