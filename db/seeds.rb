# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Clearing users database..."
User.destroy_all
puts "Products database has been successfully cleared."

puts "Clearning products database..."
Product.destroy_all
puts "Products database has been successfully cleared."

# Seeds the database with 10 Instances of the User model using the Faker gem
puts "Seeding Users database..."
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: "123123"
  )
end
puts "10 users have been created."

# Seeds the database with 30 Instances of the Product model using the Faker gem
puts "Seeding products database..."

30.times do
  title = Faker::Commerce.product_name
  Product.create!(
    title: title,
    price: rand(1..100),
    description: Faker::Lorem.paragraph,
    stock: rand(1..100),
    category: Faker::Commerce.department,

    photo: Faker::LoremFlickr.image(size: "300x300", search_terms: [title.split.last]),
    user_id: User.all.sample.id

  )
end
puts "30 products have been successfully created."
