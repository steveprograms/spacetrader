class WeaponsBay < ApplicationRecord
	has_many :weapons, dependent: :destroy
end
