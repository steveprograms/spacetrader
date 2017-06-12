class AddHistoryToPlanet < ActiveRecord::Migration[5.1]
  def change
    add_column :planets, :history, :string
  end
end
