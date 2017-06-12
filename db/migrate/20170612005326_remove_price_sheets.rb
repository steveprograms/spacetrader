class RemovePriceSheets < ActiveRecord::Migration[5.1]
  def change
    drop_table :price_sheets

    add_column :stores, :narcotics, :integer
    add_column :stores, :scrap_metal, :integer
    add_column :stores, :medicine, :integer
    add_column :stores, :grain, :integer
    add_column :stores, :gold, :integer
    add_column :stores, :plastic, :integer
  end
end
