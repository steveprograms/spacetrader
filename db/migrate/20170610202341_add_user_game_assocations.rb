class AddUserGameAssocations < ActiveRecord::Migration[5.1]
  def change
  	create_table :users do |t|
      t.timestamps
      t.string :email
      t.string :password
    end

    create_table :games do |t|
      t.timestamps
      t.belongs_to :user
      t.string :name
    end

    add_reference :players, :game
  end
end
