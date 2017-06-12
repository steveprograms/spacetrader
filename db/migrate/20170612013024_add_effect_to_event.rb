class AddEffectToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :effect, :text
  end
end
