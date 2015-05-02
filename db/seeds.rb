# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(fname:  "Juan",
			 lname: "Andujar",
             email: "j@j.com",
             age:"23",
             password:              "password",
             password_confirmation: "password",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  fname  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(fname:  fname,
  			  lname: fname+"son",
              email: email,
              age:"21",
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end