class Authentication < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_name, :oauth_expires_at, :oauth_token, :provider, :uid,:user_id,:auth_secret

end
