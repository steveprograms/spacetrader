class CreateHold < ActiveRecord::Migration[5.1]
  def change
    create_table :holds do |t|
      t.timestamps
      t.integer :capacity
      t.integer :amount
      t.belongs_to :ship
    end

    create_table :planets do |t|
      t.timestamps
      t.string :name
      t.integer :x_coord
      t.integer :y_coord
    end

    add_column :ships, :location, :string

    create_table :stores do |t|
      t.timestamps
      t.string :name
      t.belongs_to :planet
    end

    create_table :items do |t|
      t.timestamps
      t.string :name
      t.belongs_to :hold
    end

    create_table :price_sheets do |t|
      t.timestamps
      t.string :name
      t.belongs_to :store
      t.integer :narcotics
      t.integer :scrap_metal
    end
  end
end
