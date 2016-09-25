class AddAccountAndAdminToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :account_id, :integer, index: true
    add_column :users, :admin, :boolean, default: false
  end
end
