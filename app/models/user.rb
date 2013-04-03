class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :login, :password, :permission

  
  validates_uniqueness_of :login
  validates_confirmation_of :password
  validates :login, :presence => true
  validates :password, :presence => true
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true,
                    :format   => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  
end
