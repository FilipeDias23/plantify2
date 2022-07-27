require "open-uri"

puts "Cleaning database..."

Booking.destroy_all
User.destroy_all
Plant.destroy_all

fakeuser = User.create!(email: "user@mail.com", password: "123456", profile_img: "https://images.unsplash.com/photo-1571512599285-9ac4fdf3dba9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80", first_name: "fake", last_name: "user", username: "fakeuser")

puts "'fakeuser' created"
puts "Creating plants..."

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

[plantome, planthouse, bonita].each do |plnt|
  # url = plt[:image_url]
  # file = URI.open(url)
  plant = Plant.new(plnt)
  # plant.image_url.attach(io: file, filename: url[/\w+\.jpg\z/], content_type: 'image/png')
  plant.save!
  puts "Created #{plant.name}"
end
puts "Finished!"

# [plantome, planthouse, bonita].each do |attributes|
#   # img_url = attributes.fetch(:image_url)
#   # file = URI.open(img_url)
#   plant = Plant.new(attributes)
#   # plant.image_url.attach(io: file, filename: 'nes.png', content_type: 'image/png')
#   plant.save!
#   puts "Created #{plant.name}"
# end
# puts "Finished!"
