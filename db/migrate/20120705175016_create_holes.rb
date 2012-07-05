class CreateHoles < ActiveRecord::Migration
  def change
    create_table :holes do |t|
      t.string :name
      t.string :slug
      t.integer :match_id

      t.timestamps
    end
  end
end
