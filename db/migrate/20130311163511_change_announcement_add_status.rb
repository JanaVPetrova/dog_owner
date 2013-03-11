class ChangeAnnouncementAddStatus < ActiveRecord::Migration
  def up
  end

  def down
  end

  def change
    add_column :announcements, :status, :boolean
  end

end
