class LineItem < ActiveRecord::Base
	belongs_to :card
	belongs_to :product
end
