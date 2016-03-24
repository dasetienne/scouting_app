class AddStrongFootToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :strong_foot, :string
  end
end
