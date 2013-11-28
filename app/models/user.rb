class User < ActiveRecord::Base
  rolify
 letsrate_rater
 rolify :before_add => :before_add_method

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable,:rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name,:role
  # attr_accessible :title, :body

  has_many :pins
  has_many :authentications

  

def apply_omniauth(omniauth,confirmation)
 
     self.email = omniauth['info']['email'] if self.email.blank?
    
  end
 def before_add_method(role)
    # do something before it gets added
  end

end
