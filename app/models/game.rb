class Game < ApplicationRecord
	belongs_to :user
	has_one :player

	
	has_many :planets, dependent: :destroy
  has_many :events, dependent: :destroy

  after_create :initialize_data

  def create_events
    event_infos.each do |event_info|
      event = Event.new(name: event_info[0], description: event_info[1], game_id: id)
      event.save
    end
  end

  def event_infos
    [["Viral Outbreak", "A new virus, 'Skettlepop', has scientists baffled and people hiding in their homes.  The viral outbreak started approximately 3 days ago, when the virus was brought to the planet by way of a cadavier being flown in from the outter solar system.  Scientists say they were planning on studying the body, which is of a species rarely seen."], ["Police Crackdown on Drugs", "Police on the planet are reporting they have just seized 13 tons of narcotics coming in by way of starship.  They have had the sting planned, which was executed yesterday, for three months.  The 13 tons is the largest amount ever seized, and police as well as planet politicians believe we should finally see a decrease in drugs on the streets and in our kids bodies."]]
  end

  def create_planets
    planet_infos.each do |planet_info|
      planet = Planet.new(x_coord: rand(1...101), y_coord: rand(1...101), name: planet_info[0], description: planet_info[1], game_id: id)
      planet.save
    end
  end

  def planet_infos
    [["Mercurion", "A boiling hot planet, mostly inhabited by those who work in the mines"], ["Orias", "A glittering shimmering star of a city"], ["Rust", "Dusty, red, quiet"], ["K-787", "Hi 02, good stock, execute 8797"], ["Sunspeared", "GLORY, GLORY TO THE SUN"], ["Chindi", "A planet made by humans"], ["Omega", "Constantly covered with immense yellow clouds"], ["Ark", "A planet still in the bronze age, a haven for those fleeing the problems of a technological society"]]
  end

  def initialize_data
    create_events
    create_planets
  end
end

