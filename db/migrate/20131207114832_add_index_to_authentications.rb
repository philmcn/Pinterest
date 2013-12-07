class AddIndexToAuthentications < ActiveRecord::Migration
  def change
  	add_index :authentications, :provider
  	add_index :authentications, :uid
  	add_index :authentications, :user_name
  	add_index :authentications, :auth_token
  	add_index :authentications, :oauth_expires_at
  	add_index :authentications, :created_at
  	add_index :authentications, :updated_at
  	add_index :authentications, :auth_secret
  	end
end
