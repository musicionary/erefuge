class RemoveUserAccounts < ActiveRecord::Migration[5.0]
  def change
    remove_column :accounts, :user_id_id
    add_column :accounts, :user_id, :integer, index: true
  end
end
