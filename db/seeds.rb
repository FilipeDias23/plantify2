# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "user@mail.com", encrypted_password: "123")

puts "Cleaning database..."
Plant.destroy_all

puts "Creating plants..."
plantome = { name: "Plantome",
             type: "",
             description: "Lorem ipsum",
             image_url: "https://images.unsplash.com/photo-1600411833196-7c1f6b1a8b90?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80",
             care_level: 0,
             location: "Barcelona, Spain",
             user_id: 1 }
planthouse = { name: "Plant House",
               type: "Rose",
               description: "Awesome plant",
               image_url: "https://images.unsplash.com/photo-1584589167171-541ce45f1eea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
               care_level: 2,
               location: "Lisbon, Portugal",
               user_id: 1 }

[ plantome, planthouse ].each do |attributes|
  plant = Plant.create!(attributes)
  puts "Created #{plant.name}"
end
puts "Finished!"
