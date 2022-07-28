require "open-uri"

puts "Cleaning database..."

Booking.destroy_all
User.destroy_all
Plant.destroy_all

fakeuser = User.create!(email: "user@mail.com", password: "123456", profile_img: "https://images.unsplash.com/photo-1571512599285-9ac4fdf3dba9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80", first_name: "fake", last_name: "user", username: "fakeuser", location: "Barcelona, Spain")
fakeuser2 = User.create!(email: "user2@mail.com", password: "123456", profile_img: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80", first_name: "fake2", last_name: "user2", username: "fakeuser2", location: "Madrid, Spain")
fakeuser3 = User.create!(email: "user3@mail.com", password: "123456", profile_img: "https://pbs.twimg.com/media/FV_ZZHZXgAAGpBu?format=jpg&name=small", first_name: "fake3", last_name: "user3", username: "fakeuser3", location: "Lisbon, Portugal")
admin = User.create!(email: "admin@mail.com", password: "123456", profile_img: "https://images.unsplash.com/photo-1540331547168-8b63109225b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1319&q=80", first_name: "ad", last_name: "min", username: "administrator", admin: true)

puts "'fakeuser' created"
puts "Creating plants..."

plantome = { name: "Plantome",
             plant_type: "Cactus",
             description: "Lorem ipsum",
            image_url: "https://res.cloudinary.com/dukzi3epq/image/upload/v1/production/18bw7gjkynjjsr17j277a3miixuv",
             care_level: 0,
             location: "Barcelona, Spain",
             price: 49,
             user: fakeuser }
planthouse = { name: "Plant House",
               plant_type: "Rose",
               description: "Awesome plant",
              image_url: "https://cdn-ajpcj.nitrocdn.com/GXTAmEvbXwrCvAHWalvkWjxRhmmofTnC/assets/static/optimized/rev-be6a927/wp-content/uploads/2021/07/red-rose-meaning.jpg",
               care_level: 2,
               location: "Lisbon, Portugal",
               price: 15,
               user: fakeuser }
bonita = { name: "Bonita",
           plant_type: "Orchidea",
           description: "Unique kind of vegetable",
          image_url: "https://res.cloudinary.com/dukzi3epq/image/upload/v1/production/3l0jnw1mvqq890lqd3n85qxlu1ho",
           care_level: 2,
           location: "Lisbon, Portugal",
           price: 199,
           user: fakeuser2 }
evergreen = { name: "Evergreen",
           plant_type: "Tree",
           description: "Can't be greener than that",
          image_url: "https://images.freeimages.com/images/large-previews/912/green-plant-1560634.jpg",
           care_level: 5,
           location: "Rome, Italy",
           price: 27,
           user: fakeuser3 }

[plantome, planthouse, bonita, evergreen].each do |plnt|
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
