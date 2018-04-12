class ChangeContactToBeStringInUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :admin_users, :phone, :string
    change_column :users, :contact, :string
  end
end
 