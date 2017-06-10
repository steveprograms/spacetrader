class Ship < ApplicationRecord
	has_one :shield
	has_one :fuel_tank
	has_one :hold
	has_one :weapons_bay

	belongs_to :user

	def fuel
	  fuel_tank.amount
	end

	def refuel
	  fuel_price = user.planet.bay.fuel_price
	  amount_needed = fuel_tank.capacity - fuel_tank.amount
	  cost = (amount_needed * fuel_price)
	  fuel_tank.update(amount: (fuel_tank.amount + amount_needed))
	  user.update(credits: (user.credits - cost))
	end
end
