class AddSlugIndexToHoles < ActiveRecord::Migration
  def change
    add_index :holes, :slug
  end
end
