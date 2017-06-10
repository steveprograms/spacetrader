class ChangeUserIdToPlayerIdOnShips < ActiveRecord::Migration[5.1]
  def change
  	remove_reference :ships, :user
  	add_reference :ships, :player
  end
end
