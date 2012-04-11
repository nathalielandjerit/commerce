class LineItemsController < ApplicationController

    def create
        @card = current_card
        product = Product.find(params[:product_id])
        @line_item = LineItem.new
        @line_item.card_id = @card.id
        @line_item.product_id = product.id

        @line_item.save

        if @line_item.save
            flash[:notice] = "Le produit a ete ajoute au panier"
            redirect_to @card
        else
            flash[:error] = "Attention le produit n'a pas pue etre ajoute au panier"
            redirect '/store/index'
        end

    end

end
