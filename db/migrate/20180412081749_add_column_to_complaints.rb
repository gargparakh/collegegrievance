class AddColumnToComplaints < ActiveRecord::Migration[5.0]
  def change
    add_column :complaints, :status, :string
    add_column :complaints, :resolved, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
