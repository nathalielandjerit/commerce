class AdminController < ApplicationController

	layout 'admin'
	
	def index
		@total_orders = Order.count
	end
end
