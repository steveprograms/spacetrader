class Planet < ApplicationRecord
  has_one :store, dependent: :destroy
  has_one :bay, dependent: :destroy
  belongs_to :game
end
