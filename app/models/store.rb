class Store < ApplicationRecord
	belongs_to :planet
	has_one :price_sheet
end
