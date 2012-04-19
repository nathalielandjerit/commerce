class Order < ActiveRecord::Base

	has_many :line_items

	PAYEMENT_TYPES = ["Cheque", "Carte de credit", "Paypal", "Virement"]

	validates_presence_of :name, :adresse, :email, :pay_type

	def add_line_items_from_card(card)
		card.line_items.each do |line_item|
			self.line_items << line_item
		end
		self.total = card.total
	end

end
