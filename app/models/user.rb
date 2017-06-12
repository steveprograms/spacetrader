class User < ApplicationRecord
  has_many :games, dependent: :destroy
  before_save :validate_email_and_password

  

  private
  def validate_email_and_password
  	# !!email && !!password
  end

  
end
