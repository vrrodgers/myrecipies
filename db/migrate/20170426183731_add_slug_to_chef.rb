class AddSlugToChef < ActiveRecord::Migration[5.0]
  def change
    add_column :chefs, :slug, :string
    add_index :chefs, :slug, unique: true
    add_column :recipes, :slug, :string
    add_index :recipes, :slug, unique: true
  end
end