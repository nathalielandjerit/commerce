class CardsController < ApplicationController
  # GET /cards
  # GET /cards.json
  
 
  def show
    @card = Card.find(params[:id])
  end

  def destroy
  	@cards = Card.find(params[:id])
  	@cards.destroy
    flash[:success] = "votre panier est vide"
  	redirect_to root_url
  end

end
