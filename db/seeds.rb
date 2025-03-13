# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear the database
Booking.destroy_all
User.destroy_all
Teacher.destroy_all

# Create 5 users
users = []
users << kevin = User.create(email: "kevin@example.com", password: "kevinsaison", first_name: "Kevin", last_name: "Saison")
users << User.create(email: "baptiste@example.com", password: "baptistecasa", first_name: "Baptiste", last_name: "Casagrande")
users << laureline = User.create(email: "laureline@example.com", password: "laurelinedesplanches", first_name: "Laureline", last_name: "Desplanches")
users << User.create(email: "lotfi@example.com", password: "lotfibensmail", first_name: "Lotfi", last_name: "Bensmail")
users << User.create(email: "anna@example.com", password: "annaboulin", first_name: "Anna", last_name: "Boulin")
file = URI.parse("https://ca.slack-edge.com/T02NE0241-U08AA2SGX24-e56e23ebdf92-512").open
kevin.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
kevin.save
file = URI.parse("https://ca.slack-edge.com/T02NE0241-U089PLMCNA0-83fbccce4ffa-512").open
laureline.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
laureline.save

puts "Created #{User.count} users"

# Create 5 teachers
teachers = []
teachers << maelie = Teacher.create(first_name: "Maellie", last_name: "Poussier")
teachers << benoit = Teacher.create(first_name: "Benoit", last_name: "Moret")
teachers << erika = Teacher.create(first_name: "Erika", last_name: "Fonseca")
teachers << eva = Teacher.create(first_name: "Eva", last_name: "Touboulic")
teachers << jerome = Teacher.create(first_name: "Jerome", last_name: "Tan")
require "open-uri"

file = URI.parse("https://ca.slack-edge.com/T02NE0241-U016L9SL4NP-e8b125078a73-512").open
maelie.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
maelie.save

file = URI.parse("https://ca.slack-edge.com/T02NE0241-U02HQ5XG9BK-2911c07128cd-512").open
benoit.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
benoit.save

file = URI.parse("https://ca.slack-edge.com/T02NE0241-U02KKUBPTMK-192e293188a2-512").open
erika.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
erika.save

file = URI.parse("https://ca.slack-edge.com/T02NE0241-U04KF4U356V-8ed8b5abec37-512").open
eva.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
eva.save

file = URI.parse("https://ca.slack-edge.com/T02NE0241-U02S30C2FL7-5b88a1f527e3-512").open
jerome.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
jerome.save

puts "Created #{Teacher.count} teachers"

# Create 5 bookings
5.times do |i|
  Booking.create(date: Date.today, status: "pending", user: users[i], teacher: teachers[i])
end

puts "Created #{Booking.count} bookings"

puts "Seeding complete"
