class AddIndexToUsers < ActiveRecord::Migration
  def change
  	add_index :users, :encrypted_password
  	add_index :users, :reset_password_sent_at
  	add_index :users, :remember_created_at
  	add_index :users, :sign_in_count
  	add_index :users, :current_sign_in_at
  	add_index :users, :last_sign_in_at
  	add_index :users, :current_sign_in_ip
  	add_index :users, :last_sign_in_ip
  	add_index :users, :created_at
  	add_index :users, :updated_at
  	add_index :users, :name
  	add_index :users, :role

  end
end
