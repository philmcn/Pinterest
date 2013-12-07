class AddBrandToPins < ActiveRecord::Migration
  def change
  	add_column :pins, :brand, :string
  end
end
