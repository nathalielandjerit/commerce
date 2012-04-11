module ApplicationHelper

	def euro_price(decimal)
		sprintf("%0.02f EUR", decimal)
	end

end
