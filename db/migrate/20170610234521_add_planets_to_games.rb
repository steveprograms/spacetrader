class AddPlanetsToGames < ActiveRecord::Migration[5.1]
  def change
  	add_reference :planets, :game
  end
end
