class AddAuthCecretToAuthentication < ActiveRecord::Migration
  def change
  	add_column :authentications, :auth_secret, :string
  end
end
