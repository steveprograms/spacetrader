class User < ApplicationRecord
  has_many :games
  before_save :validate_email_and_password

  def create_game
    game = Game.new(user_id: id)
  end

  private
  def validate_email_and_password
  	# !!email && !!password
  end
end
