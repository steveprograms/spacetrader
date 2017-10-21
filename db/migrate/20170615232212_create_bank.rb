class CreateBank < ActiveRecord::Migration[5.1]
  def change
    create_table :banks do |t|
      t.timestamps
      t.belongs_to :game
      t.integer :loan
      t.integer :loan_interest_rate
      t.integer :savings
      t.integer :savings_interest_rate
    end
  end
end
