class AddIndexToPins < ActiveRecord::Migration
  def change
  	add_index :pins, :created_at
  	add_index :pins, :updated_at
  	add_index :pins, :image_file_name
  	add_index :pins, :image_content_type
  	add_index :pins, :image_file_size
  	add_index :pins, :image_updated_at
  	add_index :pins, :image_remote_url
  	add_index :pins, :youtube_url
  #	add_index :pins, :brand
  end
end
