class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :enroll_no
      t.string :branch
      t.string :semester
      t.string :name
      t.integer :contact
      t.string :email
      t.boolean :verified
      t.string :password_digest
      t.timestamps
    end
  end
end
