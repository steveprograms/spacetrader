class User < ApplicationRecord
  has_many :games, dependent: :destroy
  before_save :validate_email_and_password

  def new_game
    game = Game.new(user_id: 1, name: "New Game")
    game.save
  end

  private
  def validate_email_and_password
  	# !!email && !!password
  end

  
end
