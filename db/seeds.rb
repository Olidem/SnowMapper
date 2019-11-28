# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Clearing records"
Message.destroy_all
Membership.destroy_all
User.destroy_all
Group.destroy_all
Resort.destroy_all
Country.destroy_all

puts "Creating countries"
france = Country.new(
  name: "France",
  slope_length: 4242,
  cost: "€€€",
  continent: "Europe"
  )
img = URI.open('https://res.cloudinary.com/dr48k5zwm/image/upload/v1574756912/limitless_choice_runs_chamonix_france_2_96985_gp3cnb.jpg')
france.photo.attach(io: img, filename: "france.jpg", content_type: 'image/jpg')
france.save!

puts "Creating resorts"
courchavel = Resort.new(
  name: "Courchavel",
  description: "Courchevel is a winter playground for the rich and famous – attracting a steady influx of stars from Beyonce to Beckham. Ironically, the resort was originally planned to create jobs and skiing for the masses, but somewhere along the lines it morphed into the luxury resort of The Alps.<br/><br/>There are 50 five-star hotels in the whole of France and nine of them are in Courchevel. As well as top hotels, the resort now boasts three Michelin-star restaurants. The multi-level resort, complete with heated pavements, is dotted with more than 100 boutiques - you’ll find as many diamond dealers here as ski-hire shops. The tourist board does stress they offer a range of amenities for a wider clientele; it’s not all Hermès, Louis Vuitton and Valentino.<br/><br/>Courchevel is a good all-round resort. Its ski area offers a good selection of runs for all levels and it is also popular with families, off-pisters and non-skiers. The resort’s 150 kilometres is enough for most, but the avid skier can buy a pass to the vast Three Valleys ski area, opening up 600 kilometres of lift-linked runs. Ski Pass for access to the vast lift-linked ski area in the world (600km).",
  address: "COURCHEVEL, BP 37, 73122 COURCHEVEL, France",
  website_url: "https://www.courchevel.com"
  )
courchavel.country = france
img = URI.open('https://res.cloudinary.com/dr48k5zwm/image/upload/v1574756989/courchevel-1850-cropped_lilh4q.png')
courchavel.photo.attach(io: img, filename: "courchavel.jpg", content_type: 'image/jpg')
courchavel.save!

vdi = Resort.new(
  name: "Val d'Isère",
  description: "This world-class resort has earned its reputation as one of France’s top ski destinations. Val d’Isère has something for skiers and boarders of all levels: Olympic and World Cup runs, a wealth of fantastic off-piste opportunities and a varied selection of pistes including greens high up on the mountain.<br/><br/>The base of Val d'Isère sits at 1850 metres and from there, the pistes climb up to 3488 metres, at the Pointe du Montet and the Pissaillas glacier, just below at 3450 metres. Skiers have a choice of 150 kilometres of pistes for all levels, serviced by 90 lifts.<br/><br/>Val d'Isere is part of the Espace Killy ski area, shared with Tignes. Some of the world's best skiers leave their tracks here and the resort has hosted Olympic and World Cup downhill competitions, as well as the Alpine Ski World Championships.",
  address: "VAL D'ISÈRE, B.P. 228, 73150 VAL D'ISERE, France",
  website_url: "https://www.valdisere.com/en"
  )
vdi.country = france
img = URI.open('https://res.cloudinary.com/dr48k5zwm/image/upload/v1574757114/1500026649-0fe5988257cc2eebde3a9c9f321d8afa-787x564_okwo71.jpg')
vdi.photo.attach(io: img, filename: "vdi.jpg", content_type: 'image/jpg')
vdi.save!

tignes = Resort.new(
  name: "Tignes",
  description: "At Tignes, you can ski before and after everyone else. That’s the motto of this large resort, which offers summer glacier skiing and a winter season stretching from September to May. With 150 kilometres of runs and such a long season, Tignes really does have something for everyone, but intermediate and advanced skiers are especially served. Freestylers and riders will also feel at home, since Tignes was one of France’s first resorts to promote alternative ski culture and continues to welcome it with open arms.",
  address: "TIGNES, B.P. 51, 73320 TIGNES Cedex, France",
  website_url: "https://en.tignes.net"
  )
tignes.country = france
img = URI.open('https://res.cloudinary.com/dr48k5zwm/image/upload/v1574757054/540px-Tignes-winter_f4sk2f.jpg')
tignes.photo.attach(io: img, filename: "tignes.jpg", content_type: 'image/jpg')
tignes.save!
resorts = [courchavel, vdi, tignes]

puts "Creating users"
users = []
user_infos = [["Rob", "Pickard", "rob@snowsquad.com", "123456", URI.open('https://res.cloudinary.com/dr48k5zwm/image/upload/v1574331235/bdLSqWADjpU2a5cT7vbDGKqn.jpg')],
              ["Ben", "Mclaren", "ben@snowsquad.com", "123456", URI.open('https://res.cloudinary.com/dr48k5zwm/image/upload/v1574332988/47673163_nfnpke.jpg')],
              ["Ross", "Bickmore", "ross@snowsquad.com", "123456", URI.open('https://res.cloudinary.com/dr48k5zwm/image/upload/v1574332864/T02NE0241-UNR7LT7EW-067763db4da5-512_b1ex8x.jpg')],
              ["Olivier", "Deman", "olivier@snowsquad.com", "123456", URI.open('https://res.cloudinary.com/dr48k5zwm/image/upload/v1574331786/CyY16fryq1JUFW1ewWzBxyDG.jpg')]]

user_infos.each do |user_info|
  user = User.new(first_name: user_info[0], last_name: user_info[1], email: user_info[2], password: user_info[3])
  user.resort = courchavel
  user.photo.attach(io: user_info[4], filename: "profile_picture_#{user_info[0]}.jpg", content_type: 'image/jpg')
  user.save!
  users << user
end


puts "Filling resorts with squads and users"
group_names = [["Freestylers", "Hardcore freestylers get involved!", true],
  ["Big birthday drinks", "Open to everyone! Come and join"],
  ["Snow Patrol concert, free entry!", "I'm running out of ideas"],
  ["Off-piste buddies", "Looking for some squaddies to come off-piste for a few days!", true],
  ["Girls skiing trip", "Join some friendly girls skiing for the week", true]]
resorts.each do |resort|
    group_names.each_with_index do |group_name, i|
      photos = [URI.open('https://res.cloudinary.com/dr48k5zwm/image/upload/v1574758421/photo-1523815119304-615b6b81e704_ojsuvh.jpg'), URI.open('https://res.cloudinary.com/dr48k5zwm/image/upload/v1574758435/photo-1558301211-0d8c8ddee6ec_q8jhvq.jpg'), URI.open('https://res.cloudinary.com/dr48k5zwm/image/upload/v1574789951/132546-top-of-the-mountain-concert-c-tvb-paznaun---ischgl_n1ocpn.webp'), URI.open('https://res.cloudinary.com/dr48k5zwm/image/upload/v1574758427/photo-1563544769932-7a686e8c1f40_acgdlv.jpg'), URI.open('https://res.cloudinary.com/dr48k5zwm/image/upload/v1574789983/Girls-Ski-6-1024x666_hchpws.jpg')]
      group = Group.new(name: group_name[0], description: group_name[1], locked: group_name[2])
      group.resort = resort
      group.photo.attach(io: photos[i], filename: "group_picture_#{group_name[0]}.jpg", content_type: 'image/jpg')
      group.save!
        users.each do |user|
          membership = Membership.new(user: user, group: group, admin: true)
          membership.save!
        end
    end
end


puts "Creating countries"
france = Country.new(
  name: "France",
  slope_length: 4242,
  cost: "€€€",
  continent: "Europe"
  )
img = URI.open('https://res.cloudinary.com/dr48k5zwm/image/upload/v1574756912/limitless_choice_runs_chamonix_france_2_96985_gp3cnb.jpg')
france.photo.attach(io: img, filename: "france.jpg", content_type: 'image/jpg')
france.save!
italy = Country.new(
  name: "Italy",
  slope_length: 4242,
  cost: "€€€",
  continent: "Europe"
  )
img = URI.open('https://images.unsplash.com/photo-1519755605812-56339a91701a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80')
italy.photo.attach(io: img, filename: "italy.jpg", content_type: 'image/jpg')
italy.save!
austria = Country.new(
  name: "austria",
  slope_length: 4242,
  cost: "€€€",
  continent: "Europe"
  )
img = URI.open('https://images.unsplash.com/photo-1486465179369-9844c95144e0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80')
austria.photo.attach(io: img, filename: "austria.jpg", content_type: 'image/jpg')
austria.save!
switzerland = Country.new(
  name: "switzerland",
  slope_length: 4242,
  cost: "€€€",
  continent: "Europe"
  )
img = URI.open('https://www.chalets1066.com/images/content/services/i1/374/_thumb2/piste-2000-331199033.jpg')
switzerland.photo.attach(io: img, filename: "switzerland.jpg", content_type: 'image/jpg')
switzerland.save!
usa = Country.new(
  name: "usa",
  slope_length: 4242,
  cost: "€€€",
  continent: "Europe"
  )
img = URI.open('https://www.chalets1066.com/images/content/services/i1/374/_thumb2/piste-2000-331199033.jpg')
usa.photo.attach(io: img, filename: "usa.jpg", content_type: 'image/jpg')
usa.save!


















puts "Setting base urls"
resort_urls_france = ["https://www.onthesnow.co.uk/northern-alps/val-disere/",
  "https://www.onthesnow.co.uk/northern-alps/morzine/",
  "https://www.onthesnow.co.uk/northern-alps/meribel/",
  "https://www.onthesnow.co.uk/northern-alps/chamonix-mont-blanc/",
  "https://www.onthesnow.co.uk/northern-alps/les-menuires/",
  "https://www.onthesnow.co.uk/northern-alps/les-karellis/",
  "https://www.onthesnow.co.uk/northern-alps/chatel/",
  "https://www.onthesnow.co.uk/northern-alps/avoriaz/",
  "https://www.onthesnow.co.uk/northern-alps/les-2-alpes/",
  "https://www.onthesnow.co.uk/northern-alps/les-arcs-bourg-st-maurice/",
  "https://www.onthesnow.co.uk/southern-alps/vars/",
  "https://www.onthesnow.co.uk/northern-alps/courchevel/",
  "https://www.onthesnow.co.uk/northern-alps/alpe-dhuez/",
  "https://www.onthesnow.co.uk/northern-alps/tignes/",
  "https://www.onthesnow.co.uk/northern-alps/megeve/"]
resorts_url_italy = ["https://www.onthesnow.co.uk/aosta-valley/courmayeur/",
  "https://www.onthesnow.co.uk/trentino/folgarida-marilleva/",
  "https://www.onthesnow.co.uk/trentino/andalo-fai-della-paganella/",
  "https://www.onthesnow.co.uk/veneto/arabba-marmolada/",
  "https://www.onthesnow.co.uk/trentino/pontedilegno-tonale-adamello-ski/",
  "https://www.onthesnow.co.uk/suedtirol/solda-sulden/",
  "https://www.onthesnow.co.uk/suedtirol/val-gardena/",
  "https://www.onthesnow.co.uk/suedtirol/plan-de-corones-kronplatz/",
  "https://www.onthesnow.co.uk/trentino/madonna-di-campiglio/",
  "https://www.onthesnow.co.uk/veneto/cortina-dampezzo/",
  "https://www.onthesnow.co.uk/lombardia/livigno/",
  "https://www.onthesnow.co.uk/aosta-valley/champoluc-monterosa-ski/",
  "https://www.onthesnow.co.uk/suedtirol/alta-badia/",
  "https://www.onthesnow.co.uk/aosta-valley/cervinia-breuil/",
  "https://www.onthesnow.co.uk/trentino/canazei-belvedere/"]
resorts_url_austria = ["https://www.onthesnow.co.uk/tyrol/soelden/",
  "https://www.onthesnow.co.uk/vorarlberg/lech-zuers-am-arlberg/",
  "https://www.onthesnow.co.uk/tyrol/ischgl/",
  "https://www.onthesnow.co.uk/tyrol/kitzbuehel/",
  "https://www.onthesnow.co.uk/tyrol/st-anton-am-arlberg/"]
resorts_url_switzerland = ["https://www.onthesnow.co.uk/graubunden/st-moritz-corviglia/",
  "https://www.onthesnow.co.uk/valais/zermatt/",
  "https://www.onthesnow.co.uk/graubunden/davos-klosters/",
  "https://www.onthesnow.co.uk/bernese-oberland/grindelwald-wengen/",
  "https://www.onthesnow.co.uk/graubunden/arosa/"]
resorts_url_usa = ["https://www.onthesnow.co.uk/michigan/ski-brule/",
  "https://www.onthesnow.co.uk/colorado/aspen-snowmass/",
  "https://www.onthesnow.co.uk/colorado/telluride/",
  "https://www.onthesnow.co.uk/utah/deer-valley-resort/",
  "https://www.onthesnow.co.uk/colorado/keystone/",
  "https://www.onthesnow.co.uk/wyoming/jackson-hole/",
  "https://www.onthesnow.co.uk/utah/snowbird/",
  "https://www.onthesnow.co.uk/colorado/steamboat/",
  "https://www.onthesnow.co.uk/new-mexico/taos-ski-valley/",
  "https://www.onthesnow.co.uk/colorado/beaver-creek/"]
resorts_url_new_zealand = ["https://www.onthesnow.co.uk/new-zealand/cardrona-alpine-resort/",
  "https://www.onthesnow.co.uk/new-zealand/turoa/",
  "https://www.onthesnow.co.uk/new-zealand/rainbow-ski-area/",
  "https://www.onthesnow.co.uk/new-zealand/the-remarkables/",
  "https://www.onthesnow.co.uk/new-zealand/broken-river-ski-area/"]

countries = []
countries_info = [resort_urls_france, resorts_url_italy, resorts_url_austria, resorts_url_switzerland, resorts_url_usa, resorts_url_new_zealand]

puts "Creating resorts"






















