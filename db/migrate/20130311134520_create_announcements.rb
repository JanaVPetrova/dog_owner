class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :photo
      t.string :place
      t.date :find_date
      t.text :info
      t.string :contacts
      t.integer :user_id

      t.timestamps
    end
  end
end
