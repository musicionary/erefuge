class Message < ApplicationRecord
  belongs_to :account
  belongs_to :chat_room

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
