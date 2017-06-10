class Ship < ApplicationRecord
	has_one :shield
	has_one :fuel_tank
	has_one :hold

	belongs_to :user

	def fuel
	  fuel_tank.amount
	end

	
end
