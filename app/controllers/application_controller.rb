class ApplicationController < ActionController::Base
  	protect_from_forgery

  	helper_method :current_card
  	helper_method :current_user

  	def current_card
  		Card.find(session[:card_id])
  	rescue 
  		card = Card.create
  		session[:card_id] = card.id
  		card
	end

	def current_user
		if session[:user_id]
  			User.find(session[:user_id])
  		end
	end

private

  def authorize
    unless current_user
      flash[:error] = "Vous devez etre connecte"
      redirect_to root_url
    end
  end

end
