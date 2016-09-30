class AddUserToChatRoomsMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference(:chat_rooms, :user)
    add_reference(:messages, :user)

  end
end
