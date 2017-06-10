class Hold < ApplicationRecord
	belongs_to :ship
	has_many :items
end
