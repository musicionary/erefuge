# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
event_list = [
  [ "Coffee Gathering", "2017-01-10 22:30:00 UTC", "We're hosting a simple get together at our coffeeshop to have icebreaker time.", "123 Main St.", "Portland", "OR", "97006", 1 ],
  [ "Dinner Gathering", "2017-01-09 22:30:00 UTC", "We're hosting a dinner to trade recipes.", "123 Main St.", "Portland", "OR", "97006", 1 ],
  [ "Dinner Gathering", "2017-01-09 22:30:00 UTC", "We're hosting a dinner to trade recipes.", "123 Main St.", "Portland", "OR", "97006", 2 ]
]

account_list = [
  [ "Bob", "TheTomato", 1],
  [ "Larry", "Cucumber", 2]
]

user_list = [
  [ "bobthetomato", "bob@tomato.com", "1through9", 1],
  [ "larrythecucumber", "larry@cucumber.com", "1through9", 2],
]

event_list.each do |name, date, description, street, city, state, zip, user|
  Event.create( name: name, date: date, description: description, street: street, city: city, state: state, zip_code: zip, user_id: user )
end

account_list.each do |first_name, last_name, user|
  Account.create( first_name: first_name, last_name: last_name, user_id: user )
end

user_list.each do |user_name, email, password, account|
  User.create( user_name: user_name, email: email, password: password, account_id: account)
end
