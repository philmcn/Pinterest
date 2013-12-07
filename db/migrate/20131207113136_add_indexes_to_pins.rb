class AddIndexesToPins < ActiveRecord::Migration
  def change
  	add_index :pins, :description
  end
end
