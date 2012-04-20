class Admin::PhotosController < AdminController

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
			redirect_to [:admin, @product]
		else
			render :new
		end
	end

end
