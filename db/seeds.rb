# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
event_list = [
  [ "Coffee Gathering", "2017-01-10 22:30:00 UTC", "We're hosting a simple get together at our coffeeshop to have icebreaker time.", "123 Main St.", "Portland", "OR", "97006" ],
  [ "Dinner Gathering", "2017-01-09 22:30:00 UTC", "We're hosting a dinner to trade recipes.", "123 Main St.", "Portland", "OR", "97006" ],
]

event_list.each do |name, date, description, street, city, state, zip|
  Event.create( name: name, date: date, description: description, street: street, city: city, state: state, zip_code: zip )
end
