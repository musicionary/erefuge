require 'rails_helper'

describe Event do
  [:name, :date, :description, :street, :city, :state, :zip_code].each do |attr|
    it {should validate_presence_of(attr)}
  end
end
