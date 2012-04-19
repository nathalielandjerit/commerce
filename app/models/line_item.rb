class LineItem < ActiveRecord::Base
	belongs_to :card
	belongs_to :product
	belongs_to :order

	after_create :update_total_with_new
	after_update :update_total_with_modified_quantity
	after_destroy :update_total_with_destroy

	def update_total_with_new
		self.card.total += self.total
		self.card.save
	end

	def update_total_with_modified_quantity
		if self.quantity_changed?
			self.card.total -= self.total_was
			self.update_total_with_new
		end
	end

	def update_total_with_destroy
		self.card.total -= self.total_was
		self.card.save
	end

	def total
		self.product.price * self.quantity
	end

	def total_was
		self.product.price * self.quantity_was
	end

end
