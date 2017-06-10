class MoveLocationChangeToPlanetId < ActiveRecord::Migration[5.1]
  def change
  	remove_column :ships, :location
  	add_column :users, :planet_id, :integer
  end
end
