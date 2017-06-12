class Game < ApplicationRecord
  belongs_to :user
  has_one :player, dependent: :destroy

	
  has_many :planets, dependent: :destroy
  has_many :events, dependent: :destroy
  
  serialize :effect, Hash

  after_create :initialize_data

  def event_infos
    [
      {name: "Viral Outbreak", description: "A new virus, 'Skettlepop', has scientists baffled and people hiding in their homes.  The viral outbreak started approximately 3 days ago, when the virus was brought to the planet by way of a cadavier being flown in from the outter solar system.  Scientists say they were planning on studying the body, which is of a species rarely seen.", effect: {medicine: rand(500...1000)}}, 
      {name: "Police Crackdown on Drugs", description: "Police on the planet are reporting they have just seized 13 tons of narcotics coming in by way of starship.  They have had the sting planned, which was executed yesterday, for three months.  The 13 tons is the largest amount ever seized, and police as well as planet politicians believe we should finally see a decrease in drugs on the streets and in our kids bodies.", effect: {narcotics: rand(1000...1500)}}
    ]
  end

  def planet_infos
    [
      {name: "Terra", description: "Home sweet home"}, 
      {name: "Mercurion", description: "A boiling hot planet, mostly inhabited by those who work in the mines"}, 
      {name: "Orias", description: "A glittering shimmering star of a city"}, 
      {name: "Rust", description: "Dusty, red, quiet"}, 
      {name: "K-787", description: "Hi 02, good stock, execute 8797"}, 
      {name: "Sunspeared", description: "GLORY, GLORY TO THE SUN"}, 
      {name: "Chindi", description: "A planet made by humans"}, 
      {name: "Omega", description: "Constantly covered with immense yellow clouds"}, 
      {name: "Ark", description: "A planet still in the bronze age, a haven for those fleeing the problems of a technological society."}
    ]
  end

  def items
    [:narcotics, :medicine, :plastic, :gold, :grain, :scrap_metal, :diamonds, :bananas, :missiles, :uranium, :tang, :potatoes, :furs, :steel]
  end

  def create_events
    event_infos.each do |event_info|
      event = Event.new(name: event_info[:name], description: event_info[:description], effect: event_info[:effect], game_id: id)
      event.save
    end
  end

  def create_planets
    planet_infos.each do |planet_info|
      planet = Planet.new(x_coord: rand(1...101), y_coord: rand(1...101), name: planet_info[:name], description: planet_info[:description], history: planet_info[:history], game_id: id)
      planet.save
    end
  end

  def create_stores_and_bays
    planets.each do |planet|
      store = Store.new(planet_id: planet.id, gold: rand(900...1100), narcotics: rand(1800...2200), medicine: rand(2000...2400), scrap_metal: rand(15...25), grain: rand(10...20), plastic: rand(250...350), diamonds: rand(1800...2200), bananas: rand(15...25), missiles: rand(3200...3600), uranium: rand(6000...7000), tang: rand(20...40), potatoes: rand(15...30), furs: rand(70...110), steel: rand(250...350), )
      store.save

      bay = Bay.new(planet_id: planet.id, fuel_price: rand(8...12))
      bay.save
    end
  end

  def create_player_and_ship
    player = Player.new(game_id: id, name: "New Player", planet_id: Planet.find_by_name("Terra").id, credits: 1000, rank: "Plebe")
    player.save

    ship = Ship.new(player_id: player.id, name: "#{player.name}'s Ship", brand: "Kohlen", model: "Mosquito")
    ship.save

    weapons_bay = WeaponsBay.new(ship_id: ship.id)
    weapons_bay.save

    fuel_tank = FuelTank.new(ship_id: ship.id, amount: 50, capacity: 50)
    fuel_tank.save
  end

  def initialize_data
    create_events
    create_planets
    create_stores_and_bays
    create_player_and_ship
  end

  def price_changes
    planets.each do |planet|
      items.each do |item|
        change = rand(1...100)
        if change < 90
          change = rand(-10...10)
        elsif change < 99
          change = rand(-30...30)
        else
          change = rand(-100...100)
        end
        planet.store["#{item}"] += change
        planet.store.save
      end
    end
  end

  def random_event
    event = events.sample
    planet = planets.sample
    eval(event[:effect]).each do |effect|
      planet.store["#{effect[0]}"] = planet.store["#{effect[0]}"] + effect[1]
      planet.store.save
    end
  end
end

