# Erefuge

This application was desigined for my capstone project for the Epicodus programming bootcamp in Portland.  The premise of the app is to provide an avenue for refugees to connect with locals in an area, and to foster cultural exchanges where people can host dinners, create social events at coffee shops, etc.  Additionally, the application has chat functionality for the purposes of coordinating the events, but also to chat with other users.

### Architecture
Erefuge is built on a Rails backend, using a PostgreSQL database, and features new Rails 5 components like ActionCable (websockets).  Additionally, the application uses React Components to handle basic CRUD actions for working with the "events".

###Versions

This app requires Ruby 2.3 and Rails 5.0.0.1

### Installation

Open Terminal and clone the repository.  
```
$ cd Desktop
$ git clone https://github.com/musicionary/erefuge
```

Navigate to the repository and bundle Ruby gems:
```
$ cd erefuge
$ bundle install
$ git remote remove origin
```

Make sure PostgreSQL is running on your local machine, then setup the database:
```
$ rails db:setup
$ rails db:migrate
```

Start the Rails server.
```
$ rails s
```

Open your browser and navigate to `localhost:3000`. You are now ready to work with the application, and make any adjustments.

To run any tests:
```
$ rspec
```


License
-------

MIT License. Copyright &copy; 2016 "Chip Carnes"
