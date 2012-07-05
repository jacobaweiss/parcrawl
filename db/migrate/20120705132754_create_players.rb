class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string  :username, :null => false

      t.timestamps
    end
  end
end
