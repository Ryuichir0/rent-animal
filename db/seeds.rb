# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Creating 10 fake user and herds...'

10.times do
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: rand(600000..7000000), phone: "0 + #{Faker::PhoneNumber.subscriber_number(length: 9)}")
  herd = Herd.new(
    name: Faker::Creature::Animal.name,
    description: "A very kind animal, you'll enjoy running with them in the landscape with a dog of course",
    species: "Puppy",
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    unit_price: rand(0..500),
    user_id: user.id
  )
  herd.save!
end
puts 'Finished!'
