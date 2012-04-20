class ApplicationController < ActionController::Base
  	protect_from_forgery

  	helper_method :current_card

  	def current_card
  		Card.find(session[:card_id])
  	rescue 
  		card = Card.create
  		session[:card_id] = card.id
  		card
	end


end
