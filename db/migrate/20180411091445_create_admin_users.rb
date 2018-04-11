class CreateAdminUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_users do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :password_digest
      t.string :designation
      t.timestamps
    end
  end
end
