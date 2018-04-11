class CreateApiKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :api_keys do |t|
      t.string :secret_key
      t.integer :user_id
      t.string :user_token
      t.string :user_type
      t.timestamps
    end
  end
end
