class ChangeDate < ActiveRecord::Migration
  def up
  end

  def down
  end

  def change
    rename_column :announcements, :find_date, :fdate
  end
end
