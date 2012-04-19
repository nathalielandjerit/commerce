class ArticlesController < ApplicationController
  
  layout 'admin'

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    @article.save
    redirect_to articles_url
  end

  def edit
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_url
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article])
    redirect_to articles_url
  end

end