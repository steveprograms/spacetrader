class Player < ApplicationRecord
	has_one :ship
  belongs_to :game

	def buy(item_name)
    planet = Planet.find(planet_id)

    price = planet.store[item_name]

    if price < credits
      	
    	item = Item.new(name: item_name, hold_id: ship.hold.id)
    	if item.save
    	  update(credits: (credits - price))
    	end
    end
  end

  def sell(item_name)
    planet = Planet.find(planet_id)

    price = planet.store[item_name]

    if ship.hold.items.where(name: item_name).length > 0
    	
    	item = ship.hold.items.where(name: item_name).first
    	if item.destroy
    	  update(credits: (credits + price))
    	end
    end
  end

  def items
    ship.hold.items
  end

  def travel(planet_name)
	  destination = Planet.find_by_name(planet_name)
	  current = Planet.find(planet_id)
	  distance = Math.sqrt(((destination.x_coord - current.x_coord) ** 2) + (((destination.y_coord - current.y_coord) ** 2 )))
	  fuel_cost = distance * 3
	  if fuel_cost < ship.fuel
	  	puts "Traveling to " + planet_name
	  	puts "This costs " + fuel_cost.to_s + " gallons of fuel."
	  	update(planet_id: destination.id)
	  	ship.fuel_tank.update(amount: (ship.fuel_tank.amount - fuel_cost))
	  else
	  	puts "Not enough fuel, you need " + fuel_cost.to_s + " gallons of fuel for this trip."
	  end
	end

	def planet
    Planet.find(planet_id)
	end
end
