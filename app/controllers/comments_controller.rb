class CommentsController < ApplicationController
	
	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.new(params[:comment])
		if @comment.save
			flash[:success] = "bravo tru as ecrit un commantire"
			redirect_to @article
		else
			render "articles/show"
		end
	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = Comment.find(params[:id])
    	@comment.destroy
   		redirect_to articles_url
	end
end
