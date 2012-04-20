class PhotosController < ApplicationController

	layout 'admin'

	def new
		@product = Product.find(params[:product_id])
		@photo = Photo.new
	end

	def create
		@product = Product.find(params[:product_id])
		@photo = @product.photos.new(params[:photo])
		if @photo.save
			flash[:success] = "Photo successfully added"
			redirect_to @product
		else
			render :new
		end
	end

end
