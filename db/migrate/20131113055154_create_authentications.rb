class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :auth_token
      t.datetime :oauth_expires_at
      t.references :user

      t.timestamps
    end
    add_index :authentications, :user_id
  end
end
