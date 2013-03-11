class Announcement < ActiveRecord::Base
  attr_accessible :contacts, :fdate, :info, :photo, :place

  has_one :user
end
