class RenameUserToUserNameInAuthentcation < ActiveRecord::Migration
  def change
  	rename_column :authentications, :name, :user_name
  end
end
