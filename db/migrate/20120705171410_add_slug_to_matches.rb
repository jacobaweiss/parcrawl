class AddSlugToMatches < ActiveRecord::Migration
  def change
    remove_column :matches, :url
    add_column    :matches, :slug, :string
    add_index     :matches, :slug
  end
end
