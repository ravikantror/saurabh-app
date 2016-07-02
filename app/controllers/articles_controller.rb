class ArticlesController < ApplicationController
    def index
    if params[:_method].present?
      @articles = current_user.articles
    else
      @articles = Article.all
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
    # redirect_to articles_path
     @articles = Article.all
  end

  def update
      @article = Article.find(params[:id])
 
    if @article.update(article_params)
      #redirect_to articles_path
      @articles = Article.all
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
    params.require(:article).permit(:user_id, :title, :text, :post_type)
  end

end
