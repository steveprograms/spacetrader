class AddShipShieldFuelTank < ActiveRecord::Migration[5.1]
  def change
  	create_table :ships do |t|
      t.timestamps
      t.string :name
      t.string :brand
      t.string :model
    end

    create_table :shields do |t|
      t.belongs_to :ship
      t.integer :ship_id
      t.string :name
      t.string :brand
      t.string :make
      t.integer :capacity
      t.integer :amount
      t.integer :base_price
      t.timestamps
    end

    create_table :fuel_tanks do |t|
      t.belongs_to :ship
      t.integer :ship_id
      t.string :name
      t.string :make
      t.integer :capacity
      t.integer :amount
      t.integer :base_price
      t.timestamps
    end
  end
end
