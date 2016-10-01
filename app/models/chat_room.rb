class ChatRoom < ApplicationRecord
  validates :title, presence: true, uniqueness: true, case_sensitive: false
  belongs_to :user
  has_many :messages, dependent: :destroy
end
