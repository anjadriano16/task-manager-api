class AddDeviseFieldsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :encrypted_password, :string
    add_index :users, :encrypted_password
    add_column :users, :reset_password_token, :string
    add_index :users, :reset_password_token
    add_column :users, :reset_password_sent_at, :datetime
    add_column :users, :remember_created_at, :datetime
  end
end
