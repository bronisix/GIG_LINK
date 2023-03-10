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

bar = Bar.new(name: "Les Marquises (Guillaume)", url: "www.lesmarquises.freu", location: "21 rue du tage 75013 Paris", telephone: "01 42 34 56 78", description: "A deux pas de Ménilmontant, sur la rue Oberkampf, Les Marquises est un bar suffisamment spacieux et animé pour que vous puissiez y organiser vos plus beaux événements. Cet établissement est très bien situé et deviendra sans doute votre nouveau repère avec vos proches pour boire un verre en toute décontraction. En choisissant Les Marquises, vous pouvez être certain de ravir l'ensemble de vos invités en les emmenant dans un cadre hors du commun", user: guillaume)
file = URI.open("https://media-cdn.tripadvisor.com/media/photo-s/0e/03/44/7b/interieur.jpg")
bar.photo.attach(io: file, filename: "les_marquises.png", content_type: "image/png")
bar.save!
puts "Created #{bar.name}"

bar = Bar.new(name: "Café Populaire (Audrey)", url: "www.lecafepopulaire.usofa", location: "32 rue d'oberkampf 75011 Paris", telephone: "01 44 24 78 78", description: "Une très bonne adresse à côté d'oberkampf et de la rue Saint Maur. Ambiance garantie le vendredi et samedi soir (avec DJ sets). Les barmen sont très sympa. Et bière à 3€50 toute la soirée !!! Cocktails à 6€50. Difficile de faire mieux et moins cher", user: audrey)
file = URI.open("https://lh3.googleusercontent.com/p/AF1QipOHD5fQM_j5utkUxuX4M7HosNSpqp8orpsVntjT=s1600-w640")
bar.photo.attach(io: file, filename: "cafe_populaire.png", content_type: "image/png")
bar.save!
puts "Created #{bar.name}"

bar = Bar.new(name: "Dr Feelgood (Hugo)", description: "Du nom du 5ème album du groupe de métal américain Mötley Crüe, Dr Feelgood vous plonge dans une ambiance insolite. Vous pourrez également savourer de succulents cocktails accompagnés d'une délicieuse pizza ou d’un hot-dog assis sur les longs tabourets face au comptoir. Des Dj sets sont également organisés très régulièrement et vous feront profiter de vos morceaux préférés ! En fin de journée, bénéficiez d’une réduction de prix sur vos boissons lors de l'happy hour jusqu’à 20h, du lundi au samedi. Une terrasse est aussi disponible pour profiter lors des journées ensoleillées", url: "www.drfg.de", location: "10 rue daumesnil 75012 Paris", telephone: "08 23 40 90 12", user: hugo)
file = URI.open("https://s3-eu-west-1.amazonaws.com/privateaser-media/etab_photos/3578/750x375/32956.jpg")
bar.photo.attach(io: file, filename: "dr_feelgood.png", content_type: "image/png")
bar.save!
puts "Created #{bar.name}"

bar = Bar.new(name: "les DILFs (Robin)", description: "Rejoignez les mecs, les papas et les dilfs les plus chauds pour un événement réservé aux hommes dans l'un des bars gays les plus emblématiques des États-Unis", url: "www.dilfs.xxx", location: "21 rue Balard 75015 Paris", telephone: "06 09 12 47 94", user: robin)
file = URI.open("https://media.timeout.com/images/103569464/image.jpg")
bar.photo.attach(io: file, filename: "dilfs.png", content_type: "image/png")
bar.save!
puts "Created #{bar.name}"

puts "Creating events..."
bar1 = Bar.find_by(name: "Les Marquises (Guillaume)")
event = Event.new(name: "Jam session", date: "2023-04-26", bar_id: bar1.id, user: guillaume, status: :pending)
event.save!
event = Event.new(name: "Dance Party", date: "2023-04-28", bar_id: bar1.id, user: guillaume, status: :accepted)
event.save!
event = Event.new(name: "ex fan des 60's", date: "2023-04-15", bar_id: bar1.id, user: guillaume, status: :declined)
event.save!
event = Event.new(name: "OLD SCHOOL", date: "2023-01-17", bar_id: bar1.id, user: guillaume, status: :passed)
event.save!
event = Event.new(name: "fête de la musique", date: "2023-06-21", bar_id: bar1.id, user: guillaume, status: :passed)
event.save!

puts "Created #{event.name}"

bar2 = Bar.find_by(name: "Café Populaire (Audrey)")
event = Event.new(name: "Fête de la musique", date: "2023-06-21", bar_id: bar2.id, user: audrey, status: :pending)
event.save!

puts "Created #{event.name}"

bar3 = Bar.find_by(name: "Dr Feelgood (Hugo)")
event = Event.new(name: "Jazz session", date: "2023-03-01", bar_id: bar3.id, user: hugo, status: :passed)
event.save!

puts "Created #{event.name}"

bar4 = Bar.find_by(name: "Les Marquises (Guillaume)")
event = Event.new(name: "Rock the cazbah", date: "2023-03-31", bar_id: bar4.id, user: guillaume, status: :pending)
event.save!

puts "Finished!"
