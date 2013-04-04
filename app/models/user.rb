class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :login, :password, :permission

  
  validates_uniqueness_of :login
  validates_confirmation_of :password
  validates_presence_of :login
  validates_presence_of :password

  validates_presence_of :first_name
  validates_presence_of :last_name
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true,
                    :format   => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }


  has_many :announcements
  
end
