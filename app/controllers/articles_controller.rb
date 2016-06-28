class ArticlesController < ApplicationController
  def index
    if params[:_method].present?
      #@articles = Article.all
      @articles = current_user.articles
    else
      @articles = Article.all
      #@articles = current_user.articles
    end
  	
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  	@article = Article.new
  end

  def edit
  	@article = Article.find(params[:id])
  end

  def create
    @article = current_user.articles.new(article_params)
    #@article = Article.new(article_params)
    #@article.user_id = current_user.id
  	@article.save
  	redirect_to @article
  end

  def update
  		@article = Article.find(params[:id])
 
  	if @article.update(article_params)
    	redirect_to @article
  	else
    	render 'edit'
  	end
  end
 
  def destroy
  	@article = Article.find(params[:id])
  	@article.destroy
 
  	redirect_to articles_path
  end
 
private
  def article_params
    params.require(:article).permit(:user_id, :title, :text)
  end
end
