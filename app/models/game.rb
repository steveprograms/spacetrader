class Game < ApplicationRecord
	belongs_to :user
	has_one :player

	
	has_many :planets
end
