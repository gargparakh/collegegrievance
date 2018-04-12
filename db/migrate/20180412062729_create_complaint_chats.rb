class CreateComplaintChats < ActiveRecord::Migration[5.0]
  def change
    create_table :complaint_chats do |t|
        t.string :chats
        t.string :role
        t.text :image
        t.integer :complaint_id
        t.timestamps
    end
  end
end
