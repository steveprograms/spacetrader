class AddCapacityToWeaponsBay < ActiveRecord::Migration[5.1]
  def change
  	add_column :weapons_bays, :capacity, :integer
  end
end
