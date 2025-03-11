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
users << User.create(email: "kevin@example.com", password: "kevinsaison", first_name: "Kevin", last_name: "Saison")
users << User.create(email: "baptiste@example.com", password: "baptistecasagrande", first_name: "Baptiste", last_name: "Casagrande")
users << User.create(email: "laureline@example.com", password: "laurelinedesplanches", first_name: "Laureline", last_name: "Desplanches")
users << User.create(email: "lotfi@example.com", password: "lotfibensmail", first_name: "Lotfi", last_name: "Bensmail")
users << User.create(email: "anna@example.com", password: "annaboulin", first_name: "Anna", last_name: "Boulin")

puts "Created #{User.count} users"

# Create 5 teachers
teachers = []
teachers << Teacher.create(first_name: "Maellie", last_name: "Poussier")
teachers << Teacher.create(first_name: "Benoit", last_name: "Moret")
teachers << Teacher.create(first_name: "Erika", last_name: "Fonseca")
teachers << Teacher.create(first_name: "Eva", last_name: "Touboulic")
teachers << Teacher.create(first_name: "Jerome", last_name: "Tan")

puts "Created #{Teacher.count} teachers"

# Create 5 bookings
5.times do |i|
  Booking.create(date: Date.today, status: "pending", user: users[i], teacher: teachers[i])
end

puts "Created #{Booking.count} bookings"

puts "Seeding complete"
