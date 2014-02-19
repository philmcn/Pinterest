class AddBrandToPins < ActiveRecord::Migration
  def change
    add_column :pins, :brand, :string
    add_index :pins, :brand
  end
end
