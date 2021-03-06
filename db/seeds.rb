# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.create!(name:  "Example User",
#              email: "example@railstutorial.org",
#              password:              "foobar",
#              password_confirmation: "foobar")

41.times do |n|
  first_name  = Faker::Name.first_name
  last_name = Faker::Name.last_name
  username = Faker::Internet.user_name
  email = "example-#{n+1}@xyz.com"
  password = "password"
  User.create!(first_name:  first_name,
  						 last_name: last_name,
  						 username: username, 
               email: email,
               password:              password,
               password_confirmation: password)
end

Genre.create(name: "literary")
Genre.create(name: "Middle Grade")
Genre.create(name: "Romance")
Genre.create(name: "Children's")
Genre.create(name: "Young Adult")
Genre.create(name: "Fantasy")
Genre.create(name: "History")
Genre.create(name: "Sci-Fi")
Genre.create(name: "Western")
Genre.create(name: "Mystery")