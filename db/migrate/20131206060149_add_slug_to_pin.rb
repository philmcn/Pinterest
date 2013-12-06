class AddSlugToPin < ActiveRecord::Migration
  def change
    add_column :pins, :slug, :string
    add_index :pins, :slug
  end
end
