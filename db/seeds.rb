# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
Bar.destroy_all

puts "Creating user..."
john = User.create!(username: "John", email: "john@hello.freu", password: "AZERTY")
puts "user created"

puts "Creating bars..."
les_marquises = { name: "Mes Marquises", url: "wwww.lesmarquises.freu", telephone: "01 42 34 56 78", user: john }
cafe_pop = { name: "Pizza East", url: "wwww.lecafepopulaire.usofa", telephone: "01 44 24 78 78", user: john}

[les_marquises, cafe_pop].each do |attributes|
  bar = Bar.create!(attributes)
  puts "Created #{bar.name}"
end
puts "Finished!"
