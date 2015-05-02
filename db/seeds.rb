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

50.times do |n|
  fname  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  street = Faker::Address.street_address
  state = Faker::Address.state_abbr
  zip = Faker::Address.zip
  city = Faker::Address.city_prefix
  phone = Faker::PhoneNumber.phone_number
  country = Faker::Address.country

  User.create!(fname:  fname,
  			  lname: fname+"son",
              email: email,
              age:"21",
              password:              password,
              password_confirmation: password,
              street: street,
              state: state,
              zip: zip,
              city: city,
              phone: phone,
              country: country,
              activated: true,
              activated_at: Time.zone.now)
end
#microposts
users = User.order(:created_at).take(6)
15.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end


# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
