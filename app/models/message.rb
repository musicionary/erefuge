class Message < ApplicationRecord
  validates :body, presence: true, length: {minimum: 2, maximum: 1000}
  belongs_to :user
  belongs_to :chat_room

  # In this callback self is a saved message, so we basically pass it to the job. Write the job now:
  after_create_commit { MessageBroadcastJob.perform_later(self) }

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
