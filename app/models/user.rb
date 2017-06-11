class User < ApplicationRecord
  has_many :games
  before_save :validate_email_and_password

  def create_game
	  game = Game.new(name: "New Game", user_id: id)
	  game.save
	  player = Player.new(name: "Unnamed", game_id: game.id, rank: "Plebe", planet_id: Planet.find_by_name("Earth").id, credits: 5000)
	  player.save
	  planet_infos.each do |planet_info|
	  	planet = Planet.new(x_coord: rand(1...101), y_coord: rand(1...101), name: planet_info[0], description: planet_info[1], game_id: game.id)
	  	planet.save
	  end
	end

  def planet_infos
		[["Mercurion", "A boiling hot planet, mostly inhabited by those who work in the mines"], ["Orias", "A glittering shimmering star of a city"], ["Rust", "Dusty, red, quiet"], ["K-787", "Hi 02, good stock, execute 8797"], ["Sunspeared", "GLORY, GLORY TO THE SUN"], ["Chindi", "A planet made by humans"], ["Omega", "Constantly covered with immense yellow clouds"], ["Ark", "A planet still in the bronze age, a haven for those fleeing the problems of a technological society"]]
	end

  private
  def validate_email_and_password
  	# !!email && !!password
  end

  
end
