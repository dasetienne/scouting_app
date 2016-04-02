class RemoveStrongFootFromPlayers < ActiveRecord::Migration
  def change
    remove_column :players, :strong_foot
  end
end
