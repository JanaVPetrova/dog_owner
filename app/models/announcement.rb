class Announcement < ActiveRecord::Base
  attr_accessible :contacts, :fdate, :info, :photo, :place, :status

  has_one :user
end
