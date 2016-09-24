class Event < ApplicationRecord
  validates_presence_of :name, :state, :description, :street, :city, :state, :zip_code
end
