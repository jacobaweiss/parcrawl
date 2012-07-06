class AddDrinksToHoles < ActiveRecord::Migration
  def change
    add_column :holes, :par, :integer
    add_column :holes, :drink, :string
  end
end
