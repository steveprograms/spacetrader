class Planet < ApplicationRecord
	has_one :store
	has_one :bay
	belongs_to :game
end
