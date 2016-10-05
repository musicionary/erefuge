class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }

  #associations
  has_many :events
  has_one :account
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
end
