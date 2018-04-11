class CreateComplaintUpdates < ActiveRecord::Migration[5.0]
  def change
    create_table :complaint_updates do |t|
      t.integer :complaint_id
      t.text :notes
      t.string :status
      t.timestamps
    end
  end
end
