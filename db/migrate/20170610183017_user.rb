class User < ActiveRecord::Migration[5.1]
  def change
  	create_table :users do |t|
      t.timestamps
      t.string :name
      t.string :rank
      t.integer :credits
    end

    add_reference :ships, :user
  end
end
