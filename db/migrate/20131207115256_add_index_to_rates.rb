class AddIndexToRates < ActiveRecord::Migration
  def change
  	add_index :rates, :stars
  	add_index :rates, :dimension
  	add_index :rates, :created_at
  	add_index :rates, :updated_at
  	
  end
end
