class AddIndexToRatingCaches < ActiveRecord::Migration
  def change
  	add_index :rating_caches, :created_at
  	add_index :rating_caches, :updated_at
  	end
end
