class CreatePlayerSkills < ActiveRecord::Migration
  def change
    create_table :player_skills do |t|
      t.integer :player_id
      t.integer :skill_id

      t.timestamps null: false
    end
  end
end
