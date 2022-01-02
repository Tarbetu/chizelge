# Chizelge

Chizelge is a Toggl-like application coded with Rails. The name comes from a Turkish word, "Çizelge" which means "Schedule". The application helps you to manage your time and keep how much time of you spend on work. Also, adminastrators can track the time of users. 

Foundation from ZURB and HAML used heavily on the frontend.

# Dependencies

* Ruby 3.0.0 or later
* PostgreSQL as a soft dependency

# Setup

The setup is easy and you don't have to do anything more than a regular PostgreSQL and Rails setup. After you clone this repo, built up the PostgreSQL and just run the `bin/rails db:setup`. If you don't want to use PostgreSQL, you can check the `config/database.yml`.

Before the setup, you may want to create an admin for login. Just look at the admin creation template in `db/seeds.rb`. Also, you can change the users role to admin in admins dashboard.

# About RSpec and FactoryBot

It was my first testing experience. There is some problems with FactoryBot and Rspec. You can push some PR's or issues if you want to report the solutions.
