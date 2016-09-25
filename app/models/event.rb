class Event < ApplicationRecord
  validates_presence_of :name, :date, :state, :description, :street, :city, :state, :zip_code
  belongs_to :user
end
