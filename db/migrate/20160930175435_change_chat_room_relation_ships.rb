class ChangeChatRoomRelationShips < ActiveRecord::Migration[5.0]
  def change
    remove_column :chat_rooms, :account_id
    remove_column :messages, :account_id
  end
end
