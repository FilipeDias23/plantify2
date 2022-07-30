require "open-uri"

puts "Cleaning database..."

Booking.destroy_all
User.destroy_all
Plant.destroy_all

fakeuser1 = User.create!(email: "user@mail.com", password: "123456", profile_img: "https://images.unsplash.com/photo-1571512599285-9ac4fdf3dba9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80", first_name: "fake", last_name: "user", username: "fakeuser", location: "Barcelona, Spain")
fakeuser2 = User.create!(email: "user2@mail.com", password: "123456", profile_img: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80", first_name: "fake2", last_name: "user2", username: "fakeuser2", location: "Madrid, Spain")
fakeuser3 = User.create!(email: "user3@mail.com", password: "123456", profile_img: "https://pbs.twimg.com/media/FV_ZZHZXgAAGpBu?format=jpg&name=small", first_name: "fake3", last_name: "user3", username: "fakeuser3", location: "Lisbon, Portugal")
admin = User.create!(email: "admin@mail.com", password: "123456", profile_img: "https://images.unsplash.com/photo-1540331547168-8b63109225b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1319&q=80", first_name: "ad", last_name: "min", username: "administrator", admin: true, location: "Rome, Italy")

puts "'fakeuser' created"
puts "Creating plants..."

@plants = [
          { name: "Cactus",
            plant_type: "Cactus",
            description: "My Beautiful Cactus",
            image_url: "https://images.unsplash.com/photo-1509587584298-0f3b3a3a1797?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1913&q=80",
            care_level: 0,
            location: "Barcelona, Spain",
            price: 15,
            user: fakeuser1 },
          { name: "Rosita",
            plant_type: "Rose",
            description: "Nice red rose",
            image_url: "https://images.unsplash.com/photo-1518895949257-7621c3c786d7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1888&q=80",
            care_level: 1,
            location: "Lisbon, Portugal",
            price: 5,
            user: fakeuser1 },
          { name: "Bonita",
            plant_type: "Orchidea",
            description: "Is 10 years old",
            image_url: "https://c1.wallpaperflare.com/preview/164/491/768/flower-flower-pot-purple-pot.jpg",
            care_level: 3,
            location: "Lisbon, Portugal",
            price: 49,
            user: fakeuser2 },
          { name: "PalmTree",
            plant_type: "Tree",
            description: "Nice coconuts",
            image_url: "https://images.unsplash.com/photo-1532611322744-369123d95bd3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
            care_level: 0,
            location: "Rome, Italy",
            price: 75,
            user: fakeuser3 },
          { name: "Croton",
            plant_type: "Tree",
            description: "it comes with the vase",
            image_url: "https://imagens-revista.vivadecora.com.br/uploads/2020/09/croton-petra-planta-em-casa-pinterest.jpg",
            care_level: 2,
            location: "Berlin, Germany",
            price: 31,
            user: admin },
          { name: "Cactus Spikus",
            plant_type: "Cactus",
            description: "It is super easy to handle! You will love it!",
            image_url: "https://images.unsplash.com/photo-1551888419-c41351800459?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80",
            care_level: 0,
            location: "Munich, Germany",
            price: 10,
            user: fakeuser3 },
          { name: "Orchideus",
            plant_type: "Orchidea",
            description: "Natural blue color",
            image_url: "https://images.unsplash.com/photo-1582862058398-c157c8424b54?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1854&q=80",
            care_level: 3,
            location: "Madrid, Spain",
            price: 26,
            user: fakeuser2 },
          { name: "Bonsai",
            plant_type: "Bonsai",
            description: "Good feng Shui",
            image_url: "https://images.unsplash.com/photo-1599598177991-ec67b5c37318?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=725&q=80",
            care_level: 3,
            location: "Lyon, France",
            price: 68,
            user: fakeuser1 },
          { name: "Palmera Areca",
            plant_type: "Tree",
            description: "Beautifull Palmera",
            image_url: "https://cdn.sklum.com/pt/wk/1251426/areca-palm-artificial-decorative-plant.jpg",
            care_level: 1,
            location: "Porto, Portugal",
            price: 78,
            user: fakeuser2 },
          { name: "Rose",
            plant_type: "Rose",
            description: "For valentine's",
            image_url: "https://images.unsplash.com/photo-1547617774-2eb320ad93f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
            care_level: 0,
            location: "Sevilha, Spain",
            price: 9,
            user: fakeuser1 },
          { name: "Cactus",
            plant_type: "Cactus",
            description: "Care to move , it spikes!",
            image_url: "https://images.unsplash.com/photo-1509937528035-ad76254b0356?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=724&q=80",
            care_level: 0,
            location: "London, England",
            price: 13,
            user: fakeuser3 },
          { name: "Bonsai tree",
            plant_type: "Bonsai",
            description: "Very hard to handle!",
            image_url: "https://images.unsplash.com/photo-1599598425947-5202edd56bdb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2071&q=80",
            care_level: 3,
            location: "Manchester, England",
            price: 86,
            user: fakeuser2 },
          { name: "Danielle",
            plant_type: "Tree",
            description: "Tall plant",
            image_url: "https://www.plants.com/images/157651MDC_20220221-1645469235331.webp",
            care_level: 2,
            location: "Paris, France",
            price: 68,
            user: fakeuser1 },
          { name: "Vermillion",
            plant_type: "Rose",
            description: "Amazingly red!",
            image_url: "https://images.unsplash.com/photo-1596263233165-cd774250b23b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1935&q=80",
            care_level: 1,
            location: "Napoles, Italy",
            price: 3,
            user: fakeuser3 },
          { name: "Pinky",
            plant_type: "Orchidea",
            description: "Prestine blue ",
            image_url: "https://images.unsplash.com/photo-1629155035608-786f7fc9d9ba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1331&q=80",
            care_level: 3,
            location: "Faro, Portugal",
            price: 42,
            user: fakeuser1 }
]

3.times do
  @plants.each do |plnt|
  # url = plt[:image_url]
  # file = URI.open(url)
  plant = Plant.new(plnt)
  # plant.image_url.attach(io: file, filename: url[/\w+\.jpg\z/], content_type: 'image/png')
  plant.save!
  puts "Created #{plant.name}"
  end
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
