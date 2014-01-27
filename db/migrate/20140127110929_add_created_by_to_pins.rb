class AddCreatedByToPins < ActiveRecord::Migration
  def change
    add_column :pins, :created_by, :string
  end
end
