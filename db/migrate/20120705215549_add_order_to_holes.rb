class AddOrderToHoles < ActiveRecord::Migration
  def change
    add_column :holes, :hole_number, :integer
  end
end
