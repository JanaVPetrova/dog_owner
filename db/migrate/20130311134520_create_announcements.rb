class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :photo
      t.string :place
      t.date :fdate
      t.text :info
      t.string :contacts
      t.integer :user_id
      t.boolean :status

      t.timestamps
    end
  end
end
