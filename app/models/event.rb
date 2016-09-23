class Event < ApplicationRecord
  validates_presence_of :name, :date, :description, :street, :city, :state, :zip_code
end
