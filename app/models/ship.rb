class Ship < ApplicationRecord
	has_one :shield
	has_one :fuel_tank
	has_one :hold
	has_one :weapons_bay

	belongs_to :player

	def fuel
	  fuel_tank.amount
	end

	def refuel
	  fuel_price = player.planet.bay.fuel_price
	  amount_needed = fuel_tank.capacity - fuel_tank.amount
	  cost = (amount_needed * fuel_price)
	  if cost < player.credits
	  	fuel_tank.update(amount: (fuel_tank.amount + amount_needed))
	  	player.update(credits: (player.credits - cost))
	  	puts "Tank is full!"
	  else
	  	puts "Not enough credits for a full tank"
	  end
	end
end
