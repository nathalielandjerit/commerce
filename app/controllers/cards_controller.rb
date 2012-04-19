class CardsController < ApplicationController
  # GET /cards
  # GET /cards.json
  
 
  def show
    @card = Card.find(params[:id])
  end

  def destroy
  	@cards = Card.find(params[:id])
  	@cards.destroy
  	redirect_to "/store/index"
  end

end
