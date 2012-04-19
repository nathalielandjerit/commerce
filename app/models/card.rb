class Card < ActiveRecord::Base
	has_many :line_items

	def add_product(product_id)
		current_item = self.line_items.where(:product_id => product_id).first
		if !current_item.nil?
			current_item.quantity += 1
		else
			current_item = LineItem.new(:product_id => product_id)
			self.line_items << current_item
		end
		current_item
	end

end
