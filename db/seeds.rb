# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."

Booking.destroy_all
User.destroy_all
Plant.destroy_all

fakeuser = User.create!(email: "useer@mail.com", password: "123456", profile_img: "https://kitt.lewagon.com/placeholder/users/ssaunier", first_name: "fake", last_name: "user", username: "fakeuser")
puts "'fakeuser' created"

puts "Creating plants..."
require "open-uri"



plantome = { name: "Plantome",
             plant_type: "Cactus",
             description: "Lorem ipsum",
            # image_url: "https://res.cloudinary.com/dukzi3epq/image/upload/v1658574965/cwbgv94rbyz8hsnftyrc.jpg",
             care_level: 0,
             location: "Barcelona, Spain",
             price: 49,
             user: fakeuser }
planthouse = { name: "Plant House",
               plant_type: "Rose",
               description: "Awesome plant",
              # image_url: "https://res.cloudinary.com/dukzi3epq/image/upload/v1658574965/cwbgv94rbyz8hsnftyrc.jpg",
               care_level: 2,
               location: "Lisbon, Portugal",
               price: 15,
               user: fakeuser }
bonita = { name: "Bonita",
           plant_type: "Orchidea",
           description: "Unique kind of vegetable",
          # image_url: "https://res.cloudinary.com/dukzi3epq/image/upload/v1658574965/cwbgv94rbyz8hsnftyrc.jpg",
           care_level: 2,
           location: "Lisbon, Portugal",
           price: 199,
           user: fakeuser }

[plantome, planthouse, bonita].each do |attributes|
  # img_url = attributes.fetch(:image_url)
  # file = URI.open(img_url)
  plant = Plant.new(attributes)
  # plant.image_url.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  plant.save!
  puts "Created #{plant.name}"
end
puts "Finished!"
