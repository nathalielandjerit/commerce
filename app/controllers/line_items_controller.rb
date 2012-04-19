class LineItemsController < ApplicationController

    def create
        @card = current_card
        product = Product.find(params[:product_id])
        @line_item = @card.add_product(product.id)

        if @line_item.save
            flash[:notice] = "Le produit a ete ajoute au panier"
            redirect_to @card
        else
            flash[:error] = "Attention le produit n'a pas pue etre ajoute au panier"
            redirect '/store/index'
        end

    end

    def destroy
    line_item = LineItem.find(params[:id])
    line_item.destroy
    redirect_to current_card
  end

end
