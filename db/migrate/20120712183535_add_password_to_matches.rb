class AddPasswordToMatches < ActiveRecord::Migration
  def up
    add_column :matches, :password, :string
  end
  
  def down
    remove_column :matches, :password
  end
end
