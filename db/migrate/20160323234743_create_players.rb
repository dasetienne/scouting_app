class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.integer :height
      t.integer :weight
      t.string :team
      t.integer :number
      t.text :bio

      t.timestamps null: false
    end
  end
end
