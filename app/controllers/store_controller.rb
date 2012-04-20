class StoreController < ApplicationController

  def index
  	#@products = Product.paginate(:page => params[:page], :per_page => 6)
  	@q = Product.search(params[:q])
    @products = @q.result(:distinct => true).paginate(:page => params[:page], :per_page => 6)
  end

  

end
