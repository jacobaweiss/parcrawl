class AddUrlToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :url, :string
  end
end
