# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"

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

bar = Bar.new(name: "Les Marquises (Guillaume)", url: "www.lesmarquises.freu", location: "21 rue du tage 75013 Paris", telephone: "01 42 34 56 78", user: guillaume)
file = URI.open("https://media-cdn.tripadvisor.com/media/photo-s/0e/03/44/7b/interieur.jpg")
bar.photo.attach(io: file, filename: "les_marquises.png", content_type: "image/png")
bar.save!
puts "Created #{bar.name}"

bar = Bar.new(name: "Café Populaire (Audrey)", url: "www.lecafepopulaire.usofa", location: "32 rue d'oberkampf 75011 Paris", telephone: "01 44 24 78 78", user: audrey)
file = URI.open("https://lh3.googleusercontent.com/p/AF1QipOHD5fQM_j5utkUxuX4M7HosNSpqp8orpsVntjT=s1600-w640")
bar.photo.attach(io: file, filename: "cafe_populaire.png", content_type: "image/png")
bar.save!
puts "Created #{bar.name}"

bar = Bar.new(name: "Dr Feelgood (Hugo)", url: "www.drfg.de", location: "10 rue daumesnil 75012 Paris",telephone: "08 23 40 90 12", user: hugo)
file = URI.open("https://s3-eu-west-1.amazonaws.com/privateaser-media/etab_photos/3578/750x375/32956.jpg")
bar.photo.attach(io: file, filename: "dr_feelgood.png", content_type: "image/png")
bar.save!
puts "Created #{bar.name}"

bar = Bar.new(name: "les DILFs (Robin)", url: "www.dilfs.xxx", location: "21 rue Balard 75015 Paris", telephone: "06 09 12 47 94", user: robin)
file = URI.open("https://media.timeout.com/images/103569464/image.jpg")
bar.photo.attach(io: file, filename: "dilfs.png", content_type: "image/png")
bar.save!
puts "Created #{bar.name}"

puts "Creating events..."
bar1 = Bar.find_by(name: "Les Marquises (Guillaume)")
event = Event.new(name: "Les DILF", date: Date.today, bar_id: bar1.id, user: guillaume, status: :pending)
event.save!

puts "Created #{event.name}"

bar2 = Bar.find_by(name: "Café Populaire (Audrey)")
event = Event.new(name: "Les arti-chauds", date: Date.today, bar_id: bar2.id, user: audrey, status: :accepted)
event.save!

puts "Created #{event.name}"

bar3 = Bar.find_by(name: "Dr Feelgood (Hugo)")
event = Event.new(name: "DaftPunk", date: Date.today, bar_id: bar3.id, user: hugo, status: :passed)
event.save!

puts "Created #{event.name}"

bar4 = Bar.find_by(name: "Les Marquises (Guillaume)")
event = Event.new(name: "Beyoncé", date: Date.today, bar_id: bar4.id, user: guillaume, status: :pending)
event.save!

puts "Finished!"
