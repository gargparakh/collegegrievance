class CreateComplaints < ActiveRecord::Migration[5.0]
  def change
    create_table :complaints do |t|
      t.string :subject
      t.text :description
      t.text :image
      t.integer :user_id
      t.timestamps
    end
  end
end
