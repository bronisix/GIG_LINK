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
robin = User.create!(username: "Robin", email: "robin@hello.fr", password: "123456", band_name: "les DILFs", band_style: "Jazz Rock", location: "Paris", number_of_members: "5", url: "www.les-dilfs.fr", description: "Petit groupe de jazz entre amis et darons. Copains depuis 10 ans, on joue régulièrement et on ne recule devant aucun pubic.")
jerome = User.create!(username: "Jerome", email: "jerome@hello.fr", password: "123456", band_name: "Teaching Massistants", band_style: "Classique", location: "Paris", number_of_members: "12", url: "www.theteachingmassistants.com", description: "Orchestre de musique classique, apaisante et parfaite pour les cours de yoga.")
agathe = User.create!(username: "Agathe", email: "agathe@hello.fr", password: "123456", band_name: "FIGMALife", band_style: "Electro Pop", location: "Paris", number_of_members: "2", url: "www.figmalife.com", description: "Duo électropop français, originaire de Paris, évoluant sur le label Grand Blanc.")
puts "user created"

puts "Creating bars..."

bar = Bar.new(name: "Le Merle Moqueur", url: "https://www.timeout.fr/paris/bar/le-merle-moqueur", location: "11 Rue de la Butte aux Cailles, 75013", telephone: "01 43 72 11 18", description: "Ce petit bar de la Butte aux Cailles est le plus animé et le plus populaire du coin. C'est aussi l’un des moins chers, où l’on vient s’envoyer au fond du gosier une mousse ou l’un ou l’une des vingt rhums et vodkas arrangés maison, accoudé au zinc. Après quelques verres, on refait facilement le monde avec son voisin, encore inconnu il y a quelques minutes. L’ambiance est franchouillarde et chaleureuse, la musique un mélange de chansons françaises et étrangères pas toutes récentes. Les serveurs sont au top de la gentillesse, les consommations abordables. L’endroit est bondé le week-end, la foule déborde largement sur le trottoir. Les filles, sachez toutefois qu’aller aux toilettes est un véritable parcours du combattant dans cet établissement.", user: robin)
file = URI.open("https://media.timeout.com/images/103569464/image.jpg")
bar.photo.attach(io: file, filename: "les_marquises.png", content_type: "image/png")
bar.save!
puts "Created #{bar.name}"

bar = Bar.new(name: "Le Caveau des Oubliettes", url: "https://caveau-des-oubliettes.com/", location: "52 Rue Galande, 75005 Paris", telephone: "07 88 42 08 62", description: "Bar intimiste aux murs en pierre avec bar complet et concerts de jazz dans un ancien donjon médiéval.", user: hugo)
file = URI.open("https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/ba/9e/ec/salle-de-spectacle-sous.jpg?w=1200&h=-1&s=1")
bar.photo.attach(io: file, filename: "caveau.png", content_type: "image/png")
bar.save!
puts "Created #{bar.name}"

bar = Bar.new(name: "Le Duc des Lombards", url: "ducdeslombards.com", location: "42 Rue des Lombards, 75001 Paris", telephone: "01 42 33 22 88", description: "Club de jazz établi de longue date accueillant divers artistes dans un cadre intimiste proposant boissons et en-cas.", user: hugo)
file = URI.open("https://ducdeslombards.com/sites/default/files/ducdeslombards/styles/16x9_1920/public/ged/le-duc-des-lombards-05-hd.jpg?itok=nCxE52Xf")
bar.photo.attach(io: file, filename: "Duc.png", content_type: "image/png")
bar.save!
puts "Created #{bar.name}"

bar = Bar.new(name: "Le Bal Blomet", url: "https://www.facebook.com/balblomet/", location: "33 Rue Blomet, 75015 Paris", telephone: "01 55 28 74 91", description: "Le Bal Blomet est un célèbre ancien cabaret dansant antillais et club de jazz du Paris des Années folles, créé en 1924 par Jean Rézard des Wouves, au 33, rue Blomet dans le quartier Necker du 15ᵉ arrondissement de Paris, à l’ouest de Montparnasse.", user: hugo)
file = URI.open("https://www.balblomet.fr/wp-content/uploads/2018/02/TON18021449.jpg")
bar.photo.attach(io: file, filename: "Bal.png", content_type: "image/png")
bar.save!
puts "Created #{bar.name}"

bar = Bar.new(name: "Cubana Café", url: "cubanacafe.com", location: "47 Rue Vavin, 75006 Paris", telephone: "01 40 46 80 81", description: "Restaurant coloré avec des canapés en cuir, un fumoir et de la musique latine, servant des plats et des cocktails cubains.", user: hugo)
file = URI.open("https://www.cubanacafe.com/wp-content/uploads/2018/10/CubanaCafe-Restaurant-latino-paris.jpg")
bar.photo.attach(io: file, filename: "Cubana.png", content_type: "image/png")
bar.save!
puts "Created #{bar.name}"

bar = Bar.new(name: "Terrain Vague", url: "https://m.facebook.com/dreamcafemontparnasse/?locale2=fr_FR", location: "51 Rue Sedaine, 75011 Paris", telephone: "01 71 73 95 00", description: "Gérant super accueillant et très facilement joignable pour toute question. Espace réservée pour 25 personnes vraiment assez grand. L'ambiance du bar est vraiment cool et on ne se marche pas dessus (réservation un samedi soir) Et surtout, on s'entend parler !", user: hugo)
file = URI.open("https://s3-eu-west-1.amazonaws.com/privateaser-media/etab_photos/11966/1500x750/348650.jpg")
bar.photo.attach(io: file, filename: "terrain.png", content_type: "image/png")
bar.save!
puts "Created #{bar.name}"

bar = Bar.new(name: "Le Dr Feelgood", url: "https://www.facebook.com/drfeelgoodrocket/", location: "74 Rue de la Roquette, 75011 Paris", telephone: "06 95 32 93 01", description: "Le bar rock et metal de la capitale! Bières, musique, pizzas & friends 🍕 If you love rock n’roll, you will love this bar!", user: hugo)
file = URI.open("https://s3-eu-west-1.amazonaws.com/privateaser-media/etab_photos/40351/1500x750/291936.jpg")
bar.photo.attach(io: file, filename: "feelgood.png", content_type: "image/png")
bar.save!
puts "Created #{bar.name}"

bar = Bar.new(name: "les Marquises", url: "https://www.facebook.com/people/Les-Marquises-145-Rue-Oberkampf-Paris/100057029907001/", location: "145 Rue Oberkampf, 75011", telephone: "01 83 89 51 41", description: "Bar animé avec des chaises aux couleurs vives sur le trottoir, servant des cocktails et des plats réconfortants comme des pizzas.", user: guillaume)
file = URI.open("https://reservateur.fr/item_images/a962aa7a1a6c8a2e6f4d2d39d4e22b04.jpeg")
bar.photo.attach(io: file, filename: "marquises.png", content_type: "image/png")
bar.save!
puts "Created #{bar.name}"

bar = Bar.new(name: "Le Cancan Pigalle", url: "https://www.lecancanpigalle.com/menu/", location: "3 Rue de Douai, 75009 Paris", telephone: "01 40 34 16 99", description: "Le Cancan Pigalle fait son nid dans un ancien bar à hôtesses. Décor feutré, lumière tamisée, cocktails création et plats français typiques bistro, ce restaurant bar scène propose également des spectacles en début de semaine.", user: guillaume)
file = URI.open("https://www.lecancanpigalle.com/wp-content/uploads/2021/11/DSC00350.jpg")
bar.photo.attach(io: file, filename: "cancan.png", content_type: "image/png")
bar.save!
puts "Created #{bar.name}"

bar = Bar.new(name: "Les Justes", url: "http://lesjustes-pigalle.com/", location: "1 Rue Frochot, 75009 Paris", telephone: "07 85 21 16 62", description: "Cocktails originaux à la présentation soignée servis dans un bar chic agrémenté de boiseries claires et de baies vitrées.", user: guillaume)
file = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqTbt0iQHIXFcx_sDF9Y5rT3DRDKKxivgrL7-Pcy8uFEWDieVQYJ9NSzWUAgmLN95lNsg&usqp=CAU")
bar.photo.attach(io: file, filename: "Justes.png", content_type: "image/png")
bar.save!
puts "Created #{bar.name}"

bar = Bar.new(name: "le Carmen", url: "http://www.le-carmen.fr/", location: "34 Rue Duperré, 75009 Paris", telephone: "01 45 26 50 00", description: "Cocktails, gin maison et sets de DJ dans un bar-club chic à l'architecture baroque et à la décoration rétro.", user: guillaume)
file = URI.open("https://img3.parisbouge.com/UEleii46OwTf-R3NnYbh97plFAV1fYTSfdtvbYxvjX4/rs:fill:1200:800:1/g:ce/wm:1:soea:12:12:0.12/ZGU3MDhkMWQtZTNlZS00NDMwLWI4YjgtZjhhNzc4NTg4M2E5LmpwZw.jpg")
bar.photo.attach(io: file, filename: "Carmen.png", content_type: "image/png")
bar.save!
puts "Created #{bar.name}"

bar = Bar.new(name: "Le Tempo 17", url: "http://www.letempo17.com/", location: "18 Rue Brochant, 75017 Paris", telephone: "06 82 43 50 57", description: "Bar cosy à l'ambiance tamisée avec une petite scène pour des concerts variés et une courte carte de plats.", user: guillaume)
file = URI.open("https://letempo17.com/wp-content/uploads/2021/09/L1790434-1024x683.jpg")
bar.photo.attach(io: file, filename: "tempo.png", content_type: "image/png")
bar.save!
puts "Created #{bar.name}"

bar = Bar.new(name: "Jazz Club Etoile", url: "https://www.jazzclub-paris.com/fr/", location: "81 Bd Gouvion-Saint-Cyr, 75017 Paris", telephone: "01 40 68 30 42", description: "Plats traditionnels et cocktails dans un bar chic accueillant régulièrement des concerts de jazz.", user: guillaume)
file = URI.open("https://www.jazzclubetoile.com/fr/resourcefiles/homeimages/jazz-club.jpg")
bar.photo.attach(io: file, filename: "jazzclub.png", content_type: "image/png")
bar.save!
puts "Created #{bar.name}"

bar = Bar.new(name: "Cafe Populaire", url: "https://www.facebook.com/cafepopulaire11/", location: "102 Rue Saint-Maur, 75011 Paris", telephone: "01 55 28 74 91", description: "Café-bar animé avec musique et petite terrasse proposant du café, un large choix de bières et des plats de pub.", user: audrey)
file = URI.open("https://10619-2.s.cdn12.com/rests/original/104_515555338.jpg")
bar.photo.attach(io: file, filename: "cafepop.png", content_type: "image/png")
bar.save!
puts "Created #{bar.name}"

puts "Creating events..."
bar1 = Bar.find_by(name: "Terrain Vague")
event = Event.new(name: "Les DILFs se la jouent", date: "2023-02-24", bar_id: bar1.id, user: robin, status: :passed, artist_comment: "On est chaud béton pour défricher le Terrain Vague!")
event.save!
event = Event.new(name: "La revanche des DILFs", date: "2023-02-25", bar_id: bar1.id, user: robin, status: :declined, artist_comment: "On repasse le lendemain pour bitumer tout ça?")
event.save!
event = Event.new(name: "La revanche des DILFs", date: "2023-03-06", bar_id: bar1.id, user: robin, status: :declined, artist_comment: "Promis cette fois on se tient bien!")
event.save!

puts "Created #{event.name}"

bar2 = Bar.find_by(name: "Cafe Populaire")
event = Event.new(name: "A la DILF AGAIN", date: "2023-03-07", bar_id: bar2.id, user: robin, status: :pending, artist_comment: "On connait la proprio!")
event.save!

puts "Created #{event.name}"

bar3 = Bar.find_by(name: "les Marquises")
event = Event.new(name: "Les DILFs se font les marquises", date: "2023-03-06", bar_id: bar3.id, user: robin, status: :accepted, artist_comment: "Chauds pour mettre l'ambiance à la basse électrique?")
event.save!

puts "Created #{event.name}"

bar4 = Bar.find_by(name: "Le Caveau des Oubliettes")
event = Event.new(name: "Les DILFs font de la spéléo", date: "2023-02-15", bar_id: bar4.id, user: robin, status: :passed, artist_comment: "Les DILFs font de la spéléo")
event.save!

puts "Created #{event.name}"

bar5 = Bar.find_by(name: "Le Merle Moqueur")
event = Event.new(name: "La 5eme Symphonie dans ton bar", date: "2023-03-12", bar_id: bar5.id, user: jerome, status: :pending, artist_comment: "Hello, on serait partant avec mon orchestre pour venir faire découvrir la 5ème de Beethoven dans le bar ; ça vous branche?")
event.save!

puts "Created #{event.name}"

bar5 = Bar.find_by(name: "Le Merle Moqueur")
event = Event.new(name: "Live de notre nouvel EP", date: "2023-03-12", bar_id: bar5.id, user: agathe, status: :pending, artist_comment: "Coucou, on vient de sortir un EP et on serait bouillants pour le jouer dans ton bar! Tu peux l'écouter ici : https://soundcloud.com/wearefigmalife")
event.save!

puts "Created #{event.name}"

puts "Finished!"
