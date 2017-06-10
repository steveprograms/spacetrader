class AddEventsAndDescriptionToPlanets < ActiveRecord::Migration[5.1]
  def change
  	create_table :events do |t|
      t.timestamps
      t.datetime :end_date
      t.string :name
      t.string :description
    end

    add_column :planets, :description, :string
  end
end
