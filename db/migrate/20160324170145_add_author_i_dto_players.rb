class AddAuthorIDtoPlayers < ActiveRecord::Migration
  def change
    add_column :players, :author_id, :integer
  end
end
