class ChangeUserToPlayer < ActiveRecord::Migration[5.1]
  def change
  	rename_table :users, :players
  end
end
