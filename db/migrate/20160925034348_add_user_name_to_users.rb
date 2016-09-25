class AddUserNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_name, :string
    add_index :users, :user_name, unique: true
    add_column :events, :user_id, :integer, index: true
  end
end
