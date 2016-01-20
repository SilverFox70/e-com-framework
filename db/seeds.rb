# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create admin user
admin = User.new(firstname: "Adam", lastname: "Admin", email: "test@test.com", user_type: 1)
admin.password = "password"
admin.save

# create test users
10.times do
  user = User.new(
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    email: Faker::Internet.email,
    )
  user.password = "password"
  user.save
end

# seed db with fake products
20.times do
  Item.create(
    name: Faker::Commerce.product_name,
    price: rand(5...100),
    description: Faker::Lorem.paragraphs(3).join(" "),
    quantity: rand(1...10),
    picture_url: Faker::Placeholdit.image("500x500"),
    upc: Faker::Hacker.abbreviation + Faker::Number.number(10)
    )
end