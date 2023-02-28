# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
Bar.destroy_all
User.destroy_all

puts "Creating user..."
guillaume = User.create!(username: "Guillaume", email: "guillaume@hello.fr", password: "123456")
audrey = User.create!(username: "Audrey", email: "audrey@hello.fr", password: "123456")
hugo = User.create!(username: "Hugo", email: "hugo@hello.fr", password: "123456")
robin = User.create!(username: "Robin", email: "robin@hello.fr", password: "123456")
puts "user created"

puts "Creating bars..."
les_marquises = { name: "Les Marquises (Guillaume)", url: "wwww.lesmarquises.freu", telephone: "01 42 34 56 78", user: guillaume }
cafe_pop = { name: "Pizza East (Audrey)", url: "wwww.lecafepopulaire.usofa", telephone: "01 44 24 78 78", user: audrey }
doc_feelgood = { name: "Docteur Feelgood (Hugo)", url: "wwww.drfg.de", telephone: "08 23 40 90 12", user: hugo }
dilf = { name: "Les DILF (Robin)", url: "wwww.lesdilfs.xxx", telephone: "06 09 12 47 94", user: robin }

[les_marquises, cafe_pop, doc_feelgood, dilf].each do |attributes|
  bar = Bar.create!(attributes)
  puts "Created #{bar.name}"
end
puts "Finished!"
