class AddToItemTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :diamonds, :integer
    add_column :stores, :missiles, :integer
    add_column :stores, :bananas, :integer
    add_column :stores, :uranium, :integer
    add_column :stores, :tang, :integer
    add_column :stores, :potatoes, :integer
    add_column :stores, :furs, :integer
    add_column :stores, :steel, :integer
  end
end
