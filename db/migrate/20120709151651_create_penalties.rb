class CreatePenalties < ActiveRecord::Migration
  def change
    create_table :penalties do |t|
      t.integer 'player_id', :null => false
      t.string  'offense', :null => false
      t.integer 'strokes', :null => false

      t.timestamps
    end
  end
end
