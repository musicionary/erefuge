class AddIndexesToUserAccount < ActiveRecord::Migration[5.0]
  def change
    add_index :accounts, :user_id
    add_index :users, :account_id
  end
end
