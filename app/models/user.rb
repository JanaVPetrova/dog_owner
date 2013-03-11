class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :login, :password, :permission

  validates_uniqueness_of :login
  validates_confirmation_of :password

end
