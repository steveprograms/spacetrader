class AddReferenceToEvent < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :game

    add_column :events, :used_at, :datetime
  end
end
