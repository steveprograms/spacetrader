class AddToItemTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :diamonds_price, :integer
    add_column :stores, :missiles_price, :integer
    add_column :stores, :bananas_price, :integer
    add_column :stores, :uranium_price, :integer
    add_column :stores, :tang_price, :integer
    add_column :stores, :potatoes_price, :integer
    add_column :stores, :furs_price, :integer
    add_column :stores, :steel_price, :integer
  end
end
