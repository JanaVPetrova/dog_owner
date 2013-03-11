class ChangeAnnouncement < ActiveRecord::Migration
  def up
  end

  def down
  end

  def change
    add_column :announcements, :user_id, :integer
  end
end
