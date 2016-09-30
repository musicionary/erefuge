class Account < ApplicationRecord
  validates_presence_of :first_name, :last_name
  # has_and_belongs_to_many :events
  belongs_to :user
end
