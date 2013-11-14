class AddYoutubeUrlToPin < ActiveRecord::Migration
  def change
  	add_column :pins, :youtube_url, :string
  end
end
