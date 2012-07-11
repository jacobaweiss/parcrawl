class AddPlayersToMatch < ActiveRecord::Migration
  def change
    drop_table :match_players
    add_column :players, :match_id, :integer
  end
end
