class CreateBay < ActiveRecord::Migration[5.1]
  def change
    create_table :bays do |t|
      t.timestamps
      t.belongs_to :planet
      t.integer :fuel_price
      t.integer :repair_price
    end

    create_table :weapons_bays do |t|
  	  t.timestamps
  	  t.belongs_to :ship
    end

    create_table :weapons do |t|
      t.timestamps
      t.string :name
      t.belongs_to :weapons_bay
    end
  end

end
