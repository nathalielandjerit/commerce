class SessionsController < ApplicationController
	layout 'admin'
	def new
	end

	def create
		if user = User.authenticate(params[:email], params[:password])
			session[:user_id] = user.id
			flash[:success] = "vous etes connecte"
			redirect_to products_url
		else
			flash[:error] = "Vous avez entre des identifiants invalides"
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
		end
end
