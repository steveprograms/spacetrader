class RemovePriceSheets < ActiveRecord::Migration[5.1]
  def change
    

    add_column :stores, :narcotics_price, :integer
    add_column :stores, :scrap_metal_price, :integer
    add_column :stores, :medicine_price, :integer
    add_column :stores, :grain_price, :integer
    add_column :stores, :gold_price, :integer
    add_column :stores, :plastic_price, :integer
  end
end
