class Ship < ApplicationRecord
	has_one :shield, dependent: :destroy
	has_one :fuel_tank, dependent: :destroy
	has_one :hold, dependent: :destroy
	has_one :weapons_bay, dependent: :destroy

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
