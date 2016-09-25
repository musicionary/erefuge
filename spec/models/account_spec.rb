require 'rails_helper'

describe Account do
  [:first_name, :last_name].each do |attr|
    it {should validate_presence_of(attr)}
  end
end
